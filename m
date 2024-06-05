Return-Path: <linux-input+bounces-4101-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B03DE8FC735
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 11:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C78731C20965
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 09:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8615918F2E4;
	Wed,  5 Jun 2024 09:04:20 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out28-217.mail.aliyun.com (out28-217.mail.aliyun.com [115.124.28.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3EC84FDA;
	Wed,  5 Jun 2024 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717578260; cv=none; b=lsTt2HQcaYOLf5s5Q3cBhCA+e7IvrLXNiqCxyXz1UieD+XM5VANmfWySAQvZIToJqrR0HeBbfH22vRYMNxxh6i3lbJRi8Repv2rGgQdNZ98oX4oaujJat413UJk0Eo/T+QouZF0r5g9v0Hqi85VDI04o+SejSSM8zJuPNVkSthQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717578260; c=relaxed/simple;
	bh=VNcyT37lBxpbTqPwnQEHMn1V1EwcpC+O6YxwPLQmCbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxEIgyxDMMTPkzMCupygfCCRe6L9BYHODvtYaiz+coSb1BX9lglvEJTWbxkAh4q8MPF7oujXXcBjIO+19vechw7n1WjBU/QrX7xWGXl/6SqiJU8qVZnG+Oa9P/ZqZ90rx/3RkZRG7t4cRRyWyxuM371vhjApasIGOV3My8oqGHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.0743626|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0136088-0.000444171-0.985947;FP=0|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033070043001;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.XwcOocV_1717578240;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.XwcOocV_1717578240)
          by smtp.aliyun-inc.com;
          Wed, 05 Jun 2024 17:04:08 +0800
From: wangshuaijie@awinic.com
To: robh@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jeff@labundy.com,
	kangjiajun@awinic.com,
	krzk+dt@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	wangshuaijie@awinic.com
Subject: Re: [PATCH V1 1/5] dt-bindings: input: Add YAML to Awinic sar sensor.
Date: Wed,  5 Jun 2024 09:04:00 +0000
Message-ID: <20240605090400.158245-1-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <171699272363.2444823.13570711738209030716.robh@kernel.org>
References: <171699272363.2444823.13570711738209030716.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 29 May 2024 09:25:23 -0500, robh@kernel.org Wrote:
>On Wed, 29 May 2024 13:06:04 +0000, wangshuaijie@awinic.com wrote:
>> From: shuaijie wang <wangshuaijie@awinic.com>
>>=20
>> Add the awinic,aw_sar.yaml file to adapt to the awinic sar sensor driver.
>>=20
>> Signed-off-by: shuaijie wang <wangshuaijie@awinic.com>
>> ---
>>  .../bindings/input/awinic,aw_sar.yaml         | 110 ++++++++++++++++++
>>  1 file changed, 110 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/input/awinic,aw_sa=
r.yaml
>>=20
>
>My bot found errors running 'make dt_binding_check' on your patch:
>
>yamllint warnings/errors:
>
>dtschema/dtc warnings/errors:
>/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/in=
put/awinic,aw_sar.example.dtb: awinic_sar@12: 'aw_sar,update_fw' does not m=
atch any of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab=
]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|ma=
x8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '=
^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+=
\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,=
.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^ac=
me,.*', '^actions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapt=
eva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*',=
 '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*=
', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^alliedv=
ision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt=
,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^ame=
diatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^a=
ms,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^a=
nvo,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', =
'^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^aries,.*', '^arm=
,.*', '^armadeus,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,=
.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', =
'^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,=
.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^ax=
is,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*'=
, '^beagle,.*', '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*',=
 '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadm=
obi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*=
', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^canaan,.=
*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.=
*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*',=
 '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspar=
k,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi=
,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^clockwork,.*', '^cloos,.*', =
'^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', =
'^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*',=
 '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*',=
 '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cui,.*', '^cypress,.=
*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '=
^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi=
,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', =
'^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^d=
omintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^ds,.*', '^=
dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systa=
rt,.*', '^ebv,.*', '^eckelmann,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*',=
 '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element=
14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*=
', '^embest,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emt=
rion,.*', '^enclustra,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^e=
ngicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*'=
, '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^ev=
ervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^faceb=
ook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', =
'^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly=
,.*', '^focaltech,.*', '^forlinx,.*', '^freebox,.*', '^freecom,.*', '^frida=
,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycor=
e,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', =
'^geekbuying,.*', '^gef,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^ge=
niatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*=
', '^globaltop,.*', '^gmt,.*', '^goldelico,.*', '^goodix,.*', '^google,.*',=
 '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*=
', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hech=
uang,.*', '^hideep,.*', '^himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisili=
con,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', =
'^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*=
', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*', '^hycon,=
.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '=
^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^im=
agis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid=
,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingra=
sys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure,.*'=
, '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^invensen=
se,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*', '^i=
see,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo=
,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^j=
esurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^kam,.*', =
'^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*=
', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,=
.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,=
.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '=
^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo=
,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,=
.*', '^lineartechnology,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,=
.*', '^linux,.*', '^linx,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logi=
cpd,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.=
*', '^loongson,.*', '^lsi,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.=
*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marante=
c,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^mbvl,=
.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*',=
 '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*',=
 '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^met=
hode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', =
'^microsoft,.*', '^microsys,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*',=
 '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', =
'^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^mod=
tronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*=
', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*',=
 '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^=
murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^nec,.*',=
 '^neonode,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,=
.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbo=
x,.*', '^nextthing,.*', '^ni,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '=
^nordic,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', =
'^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*'=
, '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*=
', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^ope=
nailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc=
,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddi=
splays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*'=
, '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*',=
 '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*=
', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome=
,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^pola=
roid,.*', '^polyhex,.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powerti=
p,.*', '^powervr,.*', '^powkiddy,.*', '^primux,.*', '^probox2,.*', '^prt,.*=
', '^pulsedlight,.*', '^purism,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi=
,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,=
.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberry=
pi,.*', '^raydium,.*', '^rda,.*', '^realtek,.*', '^remarkable,.*', '^renesa=
s,.*', '^rervision,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.=
*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*=
', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^=
saef,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^sat=
oz,.*', '^sbs,.*', '^schindler,.*', '^seagate,.*', '^seeed,.*', '^seiroboti=
cs,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^=
sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '=
^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*'=
, '^si-linux,.*', '^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,.*', '^si=
l,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insi=
ght,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*'=
, '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*'=
, '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartlabs,.*', '=
^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,=
.*', '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*', '^sourceparts=
,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^square=
,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^sta=
rfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^ster=
icsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^s=
unchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '^=
syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biometrics,.*', =
'^tcg,.*', '^tcl,.*', '^tcs,.*', '^tdo,.*', '^team-source-display,.*', '^te=
chnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.=
*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^tesla,.*', '^tfc,.*', '^=
thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti=
,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topp=
oly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.=
*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^t=
ronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*=
', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^=
ufispace,.*', '^ugoos,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt=
,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^vamrs,.*=
', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^=
vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^=
visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^vo=
ipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*',=
 '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^wel=
ltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.=
*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlin=
k,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '=
^wobo,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.=
*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*'=
, '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectron=
ics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*'=
, '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,=
.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*', 'pinc=
trl-[0-9]+'
>	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
>Documentation/devicetree/bindings/input/awinic,aw_sar.example.dtb: /exampl=
e-0/i2c/awinic_sar@12: failed to match any schema with compatible: ['awinic=
,aw_sar']
>

The patch for version v2 will fix these issues.

>doc reference errors (make refcheckdocs):
>
>See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2024052=
9130608.783624-2-wangshuaijie@awinic.com
>
>The base for the series is generally the latest rc1. A different dependency
>should be noted in *this* patch.
>
>If you already ran 'make dt_binding_check' and didn't see the above
>error(s), then make sure 'yamllint' is installed and dt-schema is up to
>date:
>
>pip3 install dtschema --upgrade
>
>Please check and re-submit after running the above command yourself. Note
>that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>your schema. However, it must be unset to test all examples with your sche=
ma.
--

Thanks,

Wang Shuaijie

