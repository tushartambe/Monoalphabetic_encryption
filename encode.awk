#! /usr/bin/awk -f
BEGIN{
  count=1
  original_chars="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"
  replacement_chars="Q,W,E,R,T,Y,U,I,O,P,L,K,J,H,G,F,D,S,A,Z,X,C,V,B,N,M"

  split(original_chars,alphabets,",")
  split(replacement_chars,replacements,",")

  original_numbers="1,2,3,4,5,6,7,8,9,0"
  word_of_numbers="GHT,ZVG,ZISTT,YGXS,YOCT,AOB,ATCTH,TOUIZ,HOHT,MTSG"

  split(original_numbers,numbers,",")
  split(word_of_numbers,replace_numbers,",")
}
{
  split(toupper($0),chars,"")

  for(j=1;j<=length(chars);j++){
    for(k=1;k<=length(alphabets);k++){
      if(chars[j]==alphabets[k]){
        chars[j]=replacements[k]
        lines=lines""chars[j]
        break
      }
    }
  }

  for(j=1;j<=length(chars);j++){
    for(k=1;k<=length(numbers);k++){
      if(chars[j]==numbers[k]){
        chars[j]=replace_numbers[k]
        lines=lines""chars[j]
        break
      }
    }
  }
}

END{
  print lines
}
