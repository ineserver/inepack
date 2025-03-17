#version 150

precision highp float;








#define hue(v)  ((.6+.6*cos(6.*(v)+vec4(0, 23, 21, 1)))+vec4(0., 0., 0., 1.) )

#define finalize() { \
    vertexDistance=length((ModelViewMat*vertex).xyz); \
    texCoord0=UV0; \
}

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;


uniform sampler2D Sampler0;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

uniform float GameTime;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

void f_da0202f0(inout vec4 vertex) {
    gl_Position=ProjMat*ModelViewMat*vertex;
}

void f_1310037e() {
    vertexColor=Color*texelFetch(Sampler2, UV2 / 16, 0);
}


void f_f059346a(inout vec4 vertex) {
    f_da0202f0(vertex);
    if(Position.z==0. && gl_Position.x > .95) {
        vertexColor=vec4(0);
    }else{
        f_1310037e();
    }
    finalize();
}



void f_8ea34b07() {
    vertexColor=hue(gl_Position.x+GameTime*1000.)*texelFetch(Sampler2, UV2 / 16, 0);
}

void f_dd3c5b47() {
    gl_Position.y+=sin(GameTime*12000.+(gl_Position.x*6)) / 150.;
}

void f_8f3a52e3(inout vec4 vertex) {
    f_da0202f0(vertex);
    f_8ea34b07();
    finalize();
}

void f_a4bcc3db(inout vec4 vertex) {
    f_da0202f0(vertex);
    f_1310037e();
    f_dd3c5b47();
    finalize();
}

void f_785e08d9(inout vec4 vertex) {
    f_da0202f0(vertex);
    f_dd3c5b47();
    f_8ea34b07();
    finalize();
}

void f_52799978(inout vec4 vertex) {
    f_1310037e();
    float vertexId=mod(gl_VertexID, 4.);
    if(vertex.z <= 0.) {
        if(vertexId==3. || vertexId==0.) {
            vertex.y+=cos(GameTime*12000. / 4)*.1;
            vertex.y+=max(cos(GameTime*12000. / 4)*.1, 0.);
        }
    }else{
        if(vertexId==3. || vertexId==0.) {
            vertex.y-=cos(GameTime*12000. / 4)*3;
            vertex.y-=max(cos(GameTime*12000. / 4)*4, 0.);
        }
    }
    f_da0202f0(vertex);
    finalize();
}

void f_dfc0b32b(inout vec4 vertex) {
    float vertexId=mod(gl_VertexID, 4.);
    if(vertex.z <= 0.) {
        if(vertexId==3. || vertexId==0.) {
            vertex.y+=cos(GameTime*12000. / 4)*.1;
            vertex.y+=max(cos(GameTime*12000. / 4)*.1, 0.);
        }
    }else{
        if(vertexId==3. || vertexId==0.) {
            vertex.y-=cos(GameTime*12000. / 4)*3;
            vertex.y-=max(cos(GameTime*12000. / 4)*4, 0.);
        }
    }
    f_8ea34b07();
    f_da0202f0(vertex);
    finalize();
}

void f_76ef0fbb(inout vec4 vertex, float speed) {
    f_da0202f0(vertex);
    float blink=abs(sin(GameTime*12000.*speed));
    vertexColor=Color*blink*texelFetch(Sampler2, UV2 / 16, 0);
    finalize();
}



void f_c613f946(inout vec4 vertex) {
    f_da0202f0(vertex);
    f_1310037e();
    vertexColor=vec4(1, 1, 1, vertexColor.a); 
    finalize();
}


void main() {
    vec4 vertex=vec4(Position, 1.);
    ivec3 iColor=ivec3(Color.xyz*255+vec3(.5));

    
    
    if(iColor==ivec3(255, 85, 85))
    {
        f_f059346a(vertex);
        return;
    }
    

    
    if(fract(Position.z) < .1) {
        
        
        if(iColor==ivec3(19, 23, 9))
        {
            gl_Position=vec4(2, 2, 2, 1);
            f_1310037e();
            finalize();
            return;
        }
        

        
        
        if(iColor==ivec3(57, 63, 63)) {
            
            
            f_da0202f0(vertex);
            f_1310037e();
            finalize();
            return;
        }

        
        if(iColor==ivec3(57, 63, 62)) {
            f_a4bcc3db(vertex);
            return;
        }

        
        if(iColor==ivec3(57, 62, 63)) {
            
            f_a4bcc3db(vertex);
            return;
        }

        
        if(iColor==ivec3(57, 62, 62)) {
            f_52799978(vertex);
            return;
        }

        
        if(iColor==ivec3(57, 61, 63)) {
            f_52799978(vertex);
            return;
        }

        
        if(iColor==ivec3(57, 61, 62)) {
            f_76ef0fbb(vertex, .5);
            return;
        }

        

        
    }

    
    
    if(iColor==ivec3(78, 92, 36))
    {
        f_c613f946(vertex);
        return;
    }
    

    
    
    
    if(iColor==ivec3(230, 255, 254))
    {
        f_8f3a52e3(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 255, 250))
    {
        f_a4bcc3db(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 251, 254))
    {
        f_785e08d9(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 251, 250))
    {
        f_52799978(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 247, 254))
    {
        f_dfc0b32b(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 247, 250))
    {
        f_76ef0fbb(vertex, .5);
        return;
    }

    
    

    
    
    
    if(iColor==ivec3(255, 255, 254))
    {
        f_8f3a52e3(vertex);
        return;
    }

    
    if(iColor==ivec3(255, 255, 253))
    {
        f_a4bcc3db(vertex);
        return;
    }

    
    if(iColor==ivec3(255, 255, 25))
    {
        f_785e08d9(vertex);
        return;
    }

    
    if(iColor==ivec3(255, 255, 251))
    {
        f_52799978(vertex);
        return;
    }

    
    if(iColor==ivec3(255, 254, 254))
    {
        f_dfc0b32b(vertex);
        return;
    }
    

    
    f_da0202f0(vertex);
    f_1310037e();
    finalize();
}