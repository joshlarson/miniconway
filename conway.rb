x,y=$_.split;g||={};t=->x,y{g[[x,y]]=0if !g.delete([x,y])};x==?t?(n=->c,f{c.map{|(x,y),_|(r=(-1..1)).map{|u|r.map{|v|f[x+u,y+v]}}}};w={};n[g,->x,y{k=0;n[{[x,y]=>0},->r,c{k+=1if g[[r,c]]}];k-=1if g[[x,y]];w[[x,y]]=0if k==2&&g[[x,y]]||k==3}];g=w): x=~/\d+/?t[x.to_i,y.to_i]:0;puts (b="+#{"-"*21}+\n")+(s=(-10..10)).map{|y|"|"+s.map{|x|g[[x,-y]]??x:" "}.join+"|\n"}.join+b
