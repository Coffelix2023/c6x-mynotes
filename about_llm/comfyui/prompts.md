## AIGC-Prompts 提示词参考库

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

### 📒 常用提示词

```cfg

# 相机与构图类
    tilt-shift camera  #移轴摄影
    full-body composition, whole body of character #全身
    tiny miniature scene #微缩景观
    a real photo of figurine model #手办
    long-thin limbs  #蒂姆波顿风格四肢(瘦瘦的)
    condid photo  #街头抓拍
    aerial photo  #航拍
    retro photo  #复古
    shot by arri-alexa 35 xtreme with 8mm focal length and aperture 16,
    Fuji film,

# 风格
    cyborg metallic robot
    steampunk
    cyberpunk
    vintage
    gorgeous #美丽动人的
    mysteriously
    vignette  #复古的
    magnificent  #宏伟的
    epic
    cinematic
    dramatic
    folk
    cynberpunk
    steampunk
    intricate  #错综复杂的
    elegant  #华丽的
    majestic  #宏伟的
    glamour  #吸引人的

# 身体
    adventures
    slim body
    in wastelander clothes
    slim, petite
    pronounced feminine feature
    sharp nose
    egg-shaped face
    perfect proportion of
    thin neck
    Thin eyebrows
    fairy skin
    pores
    smirk
    facial features
    Mustache  #胡子
    pale skin
    ultra realistic skin
    humanoid  #类人

# 衣服类
    pantyhose  #裤袜
    thigh boots  #过膝长靴
    tight-fitting  #紧身衣
    transparent pantyhose
    open jacket
    necktie
    streetwear

# 发饰
    Curly (卷发)
    pigtails (小马尾)
    ponytail (大马尾)
    hair bun (丸子头)
    Curly (卷发)
    bangs (刘海)
    braided (辫子)
    slicked (顺滑)
    straight
    Wispy (细柔)
    wavy （大波浪）
    twintail （双马尾）
    Layered (分层)
    Updo (发髻)
    Undercut （切分）
    Wavy Bob Bangs
    long haircut

# 表情
    Puzzled (困惑)
    warm smile
    Laugh
    Frowning (皱眉)
    Pouting (撅嘴)
    thoughtful  思索
    melting  怜悯
    flirting  俏皮

# 艺术家
    makoto shinkai #新海诚
    Hayao Miyazaki #宫崎骏
    Yoji Shinkawa #新川洋司
    Akira Toriyama #鸟山明
    ghibli-studio #吉卜力
    pixar-studio #皮克斯
    disney animation #迪士尼
    inspired by Tim Burton film #inspired by 防止和谐了提示词
    Burtonesque #蒂姆波顿风格
    gothic whimsical #哥特风格

# 灯光
    Backlight
    sidelight
    dim lighting
    cinematic lighting
    dynamic lighting
    god rays
    sunlight
    underexposed
    Fujifilm XT3
    filmgrain
    magical energy
    dark atmosphere
    volumetric lighting

# 构图
    dynamic shot
    action shot
    below angle shot
    high angle shot
    close up
    medium shot
    wide shot
    symmetric
    asymmetric
    dynamic shot
    selfie photo of
    slow motion
    soft focus
    full figure

# 材质
    shinny
    glossy
    reflection
    marbel-sculpture
    translucent molten body
    transparent plastic
    mayan art
    historic pictures

# 负面提示词备用
    lowres, error, cropped, worst quality, low quality, jpeg artifacts, out of frame, watermark, signature,
    (low quality, worst quality:1.2),
    (bad anatomy), (inaccurate limb:1.2),
    bad composition, inaccurate eyes, extra digit, fewer digits, (extra arms:1.2), (people:1.4), background people

```

### 📒 Wan2.2

```cfg

# 电影美学
    Professional camera language,
    supports multi-dimensional visual control such as lighting, color, and composition
    moothly restores various complex motions,
    enhances motion controllability and naturalness,
    Complex scene understanding,
    multi-object generation,
    better restoring creative intentions

```

### 📒 Qwen-image-edit

```cfg

# 修改角色角度:
    turn character from image1 to side view

# 修改相机角度:
    将镜头向前/后移动
    Move the camera forward/backward ( to close-up shot)
    将镜头向左/右移动
    Move the camera left/right
    将镜头向上/下移动
    Move the camera up/down
    将镜头向左/右旋转45度
    Rotate the camera 45 degrees to the left/right
    将镜头转为俯拍
    Move the camera upwards to a bird's-eye view
    Turn the camera to a top-down view
    将相机切换到仰视视角
    turn the camera to a worm's-eye view
    将镜头转为广角镜头
    Convert/Turn the camera to a wide-angle lens
    将镜头转为特写镜头
    Transform/Turn the camera to a close-up shot

```

### 📒 插画

```cfg

    Craig Mullins	#西方古典插画
    Andrew wyeth	#西方古典插画
    darwin cook	#美漫
    Alejandro Bursido	#西方厚涂
    artgerm	#西方厚涂
    Aubrey Beardsley	#西方奇幻工笔
    Alphonse Mucha	Flat color illustration
    Frederic Church	#古典厚涂
    Frank Frazetta	#奥秘古典厚涂
    Thomas Cole	#奥秘古典厚涂
    Albert Bierstadt	#奥秘古典厚涂
    Alberto Vargas	#经典美国海报
    Aleksi Briclot	#西方厚涂
    Craig Davison	#西方厚涂
    Ian McQue	#西方概念
    Syd Mead	#西方概念
    greg rutkowski	#西方厚涂
    Claude Monet	#莫奈
    Pablo Picasso	#毕加索
    Salvador Dali	#达利
    Vincent van Gogh #梵高

```

### 📒 艺术家

```cfg

# 日本
    Takehiko Inoue	#井上雄彦_OK
    Hirokazu Kore-eda	#是枝裕和
    Hirohiko Araki	#荒木飞吕彦
    Akira Kurosawa	#黑泽明
    Audrey Kawasaki	#川崎绫
    Takeshi Kitano	#北野武
    Yoji Shinkawa	#新川洋司
    Tetsuya Nakashima	#中岛哲也
    akihiko yoshida	#吉田明彦
    Takashi Miike	#三池崇史
    makoto shinkai	#新海诚
    Yoshitaka Amano	#天野喜孝
    Hayao Miyazaki	#宫崎骏

```

### 📒 备用提示词

```cfg

    a beautiful chinese young woman sits on the top of the cube-shaped cactus in desert and with her hands on her hips,

    the woman with half violet and half white wavy hair,
    and weard light-yellow tight-fitting suit,
    red text "COFFELIX" printed on chest,

    Look up at the sky,

    The scene is the whole body of the character, with a stormy atmosphere, two tornadoes in the distance of the rolling desert,

    light from the distance of left behind, outlining the charming silhouette of the character,

    ugly, bad art, poorly drawn hands, poorly drawn feet, poorly drawn face, out of frame, extra limbs, disfigured, deformed, body out of frame, blurry, bad anatomy, blurred, watermark, grainy, tiling, signature, cut off, draft

    steampunk brass wood steel, hyperdetailed illustration, complex machinery

    beautiful portrait, 8k resolution concept art portrait, hyperdetailed, intricately detailed, trending on Artstation, triadic colors, volumetric lighting, soft focus, dynamic lighting

    https://cdn.discordapp.com/attachments/1072395415602868245/1075313342706634822/Coffelix_a_young_man_fightingset_in_fire_tai_chiswirlying_dust__39f89ba1-0858-4993-97c8-113345a2dc63.png

    https://cdn.discordapp.com/attachments/1072395415602868245/1075313276692480051/Coffelix_a_young_man_fightingset_in_fire_tai_chiswirlying_dust__39f89ba1-0858-4993-97c8-113345a2dc63.png

    https://cdn.discordapp.com/attachments/1072395415602868245/1075313996116262963/Coffelix_a_young_man_fightingset_in_fire_tai_chi_hanfu_long_hai_f2555930-b837-4f46-836a-759f4ffdd021.png

    a warrior young man fighting, set in fire, TaiChi, swirlying dust and fallen leaves, hanfu, long hair, highly realistic, dark lighting, back light, full body shot, 18mm, --ar 2:1

    film still, a warrior young man set in fire, taiji pose, 18 palms kungfu, hanfu, long hair, taoist,

    full body shot, low angle shot, back light, cinematic light,18mm,  —ar 16:9 —no weapon


    film still, a warrior young man set in fire, tai chi pose, hanfu, long hair, several leaves and short sticks floating on ground, energe surround, taoist, a huge arhat shadow behind young man, full body shot, wide shot, 8k,back light, Shang-Chi style, —ar 9:16 —no weapon

    full-length portrait man, handsome face, chinese, short hair, brown eyes, looking up, low angle shot, epic rim lighting, dof, fog, cinematic, intricate details, — —ar 2:3 —no blurry, no urgly, no disfigured, no two’s

    mdjrny-v4 style portrait photograph of Madison Beer as Pocahontas, young beautiful norse woman, perfect symmetrical face, transparent latex dress, (((wild west))) environment, Utah landscape, ultra realistic, concept art, elegant, ((intricate)), ((highly detailed)), depth of field, ((professionally color graded)), 8k, art by artgerm and greg rutkowski and alphonse mucha

    1 sexy girl, walking, brown skin, perfect breast, detailed face, tattoos, shadow effect, spotlight, city alley in the background, background blur, hyperrealistic, photografic, 8k, epic ambient light, octane render

    professional photo of a beautiful young woman, gorgeous beauty, sweaty pale skin, symmetrical face, wearing white sports bra, toned stomach, perfect boobs, dense voluminous hair, rooftop terrasse gym in background, penthouse environment, stunning background with city view, cinematic lighting, highly detailed, intricate, sharp focus, (((depth of field))), (((f/1.8))), 85mm, (((professionally color graded))), (((dusk))), soft diffused light, volumetric fog, hdr 4k, 8k

```
