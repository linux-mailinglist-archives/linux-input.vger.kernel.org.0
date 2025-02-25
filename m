Return-Path: <linux-input+bounces-10366-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ED3A44EDB
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 22:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A9B016EAA4
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 21:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814B41A9B46;
	Tue, 25 Feb 2025 21:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="PfgA2r01";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RoJ3Gond"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689361922DD;
	Tue, 25 Feb 2025 21:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518897; cv=none; b=onh62Szxe1G+qSwoYKanMtKH09knHXkTQUUXgV4HIVLJ9DwwyckdO7EN+bW/4d7CXfF8F0y418PglS69NfqUDp2at+70DtxfBj3LY43xqH+52PCRbcDtSM+cUubE2ay8UNtu+axB5ntcn4cO7uePUgBhdpbt0R4ld7vcV7seoxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518897; c=relaxed/simple;
	bh=1jJ3DPz9rPIN4m9zPtY7SDJfgJPKWR1kYVbqG1gjhbY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=t12/1j+CjtqKo0cDBxhss021R8RLLiAoFHa99ivXBR6wcnfgyIcUl/0DRuWJYdHNQnyTS+NmJ4QIdnReae6lN72GYUDb8nLZJ1+UUlRexmRQy+n71/fDWRrB2p4DOu9RuqlGyrFtyJnfvHa9BeUXjH5wyl/XB+a5aiKVH4kdNyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=PfgA2r01; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RoJ3Gond; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 7DE631380A18;
	Tue, 25 Feb 2025 16:28:14 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Tue, 25 Feb 2025 16:28:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740518894;
	 x=1740605294; bh=MtdYR/vb9G3ff/av9xKkRUdGCwEQqS/NHkU708blTyo=; b=
	PfgA2r0175nB+9AZCdNkZJVEuPBRPK+x8XFvJVX23UCSjqK/zg/P3Q/DTPl78uZz
	NDdixu0A/ylm/9CsoPS4qW3Rsr4MpsF2dx9wKYN1D89JG1ww5yvBVY5Qfeeu2aZl
	Y1siKR9M8Fr0McVny9a4aP016h2wiJ2k6G68GGAHWu5OiniexkPfOCz87Jpn1OB9
	2i/4xXAnQ5Kck3xv1rSNLt9JB6lJPpqIoQDf4h2DBQdDUSaZogfOSCkG7Ywx7Ld3
	u58fldAo/yP/+4Qs995+K8Ihfr/4iESy++1s0oihNLV5CLFOiu7iDsdt+CXxpFW/
	i7CIxV0J2P16ft2EUOSqAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740518894; x=
	1740605294; bh=MtdYR/vb9G3ff/av9xKkRUdGCwEQqS/NHkU708blTyo=; b=R
	oJ3Gond8a8niXCP/Qit4wtWf/3Jln5eizJKHsrADztHcfkQ2avURcliG9rL6BJtc
	LvvKePVZldrEw5M+iF9LPqNFWHkxYg1maPmqxrWrrL83P7QdqrtsUCQ2Wm3v9Nmb
	ZV0M4fvI56i70ctRb0a0iV8hnTVyJ9fnAP3a/uEEMmQMhTOJ9k8ab148efi+e3eE
	HWZg6ubCCuoBjLw4P6tpZKQ8jPqcmJW+jywwjZdMpPYYBgGL/IJHOCzblBp3Z6RC
	t27qp14dI9/dayTUIckPXI4QPk12OpixyA3ZCi6QuVbOalma/lWO97FsTNhBVHA7
	pmE1LTmxIwyaaesAZdMPQ==
X-ME-Sender: <xms:7TW-Z9Hj8frpn7R37xRxq9_2uuMG1ccp-aB6dIUP2jgjCeATUN1ZIw>
    <xme:7TW-ZyXiTbarRFD3PB18jF10wDbug04ggOpsXmoHqQhkLrqz3-ig5n2gPAztlMRj3
    2Ly-jaUM0cMJpVdCrI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvdejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddv
    geejvdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
    vddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnh
    highessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthho
    rhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepughmihhtrhihrdhtohhroh
    hkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhm
    fedvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopeholhhivhgvrhdrghhrrghuthgvsehkohgtohgtohhnnhgvtghtohhr
    rdgtohhmpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkiheslhhinh
    grrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhs
    thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtmhefvd
    esshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhm
X-ME-Proxy: <xmx:7TW-Z_Lf0h_F9LfHlAbPSHJ1M7dqaYA9o2zdhTqjUf6fTlXrfBoPZQ>
    <xmx:7TW-ZzEy-JXrFHyi8ig_wxGun2sIisjYJ7X1sbaaESVNPE9stejGEQ>
    <xmx:7TW-ZzUpNdeb9dSrxfeAWG3pserYEQjUk-qDMHVXZanXNxiduZjORg>
    <xmx:7TW-Z-PFath8dLqwtCIY0EkLhBoN0kAJLAR4XKn115qWVQr6PmgLGA>
    <xmx:7jW-Z2MXGtKopnNDXF4v6CWGGu41RDXkX3vnqZUDqEntea_244bFd27Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 92F0E2220072; Tue, 25 Feb 2025 16:28:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 22:27:24 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Yu Jiaoliang" <yujiaoliang@vivo.com>,
 "Oliver Graute" <oliver.graute@kococonnector.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <181dbdb8-c050-4966-8cb4-2f39495ff3f9@app.fastmail.com>
In-Reply-To: 
 <ccjng5mrvqngfg6eujq6mtl6dj2sz5vsqvjoqz6gm5ntcibduz@wqoc6zhchrvv>
References: <20250225145332.1116557-1-arnd@kernel.org>
 <6xoycaft6wnd4sm74f2o4koc7lvyl2mtxp2kc6lc4dzpjvby53@ejm5ssbfzbph>
 <a6d10d80-79d3-426f-9dc8-0ddab77e89d9@app.fastmail.com>
 <ccjng5mrvqngfg6eujq6mtl6dj2sz5vsqvjoqz6gm5ntcibduz@wqoc6zhchrvv>
Subject: Re: [PATCH] [v2] Input: stmpe-ts - mark OF related data as maybe unused
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025, at 21:17, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Feb 25, 2025 at 05:25:05PM +0100, Arnd Bergmann wrote:
>> On Tue, Feb 25, 2025, at 16:47, Uwe Kleine-K=C3=B6nig wrote:
>> > On Tue, Feb 25, 2025 at 03:53:26PM +0100, Arnd Bergmann wrote:
>> > the warning goes away and stmpe_ts_ids isn't included in the .o file
>> > without having to add __maybe_unused to the driver.
>> >
>> > I would consider that a superior approach.
>>=20
>> Not sure, I can see how this avoids some warnings, but this is
>> currently the only remaining instance of this problem (I fixed
>> another two recently), and in most cases a MODULE_DEVICE_TABLE()
>> entry that is completely unused ends up pointing to a real bug,
>> where there is a table but it's not also part of the
>> device_driver definition.
>
> It might be the only instance without __maybe_unused and so triggering=
 a
> warning. But there is also:
>
> $ git grep -E 'of_device_id.*__maybe_unused' | wc -l
> 231
>
> $ git grep -E 'mdio_device_id.*__maybe_unused' | wc -l
> 58

I'm not really worried about these at the moment, other than not
wanting to pile on to that mess with more __maybe_unused
annotations.

My goal here is to get the point of enabling -Wunused-const-variable
by default in order to find other bugs before they make it into
the kernel.

Andy Shevchenko really wants to remove the of_match_ptr()
macro so we can stop adding pointless __maybe_unused annotations
for every driver that accidentally uses of_match_ptr(). This
is certainly a good idea as well, just not what I'm trying to
do this time.

Apparently we have already accumulated a bunch of drivers that
ended up with __maybe_unused but no actual reference from
of_match_ptr():

$ git grep -l 'of_device_id.*__maybe_unused' |xargs grep -Lw of_match_pt=
r | wc -l

but only a couple of drivers that don't use of_match_ptr()
or of_match_node():

$ git grep -l 'of_device_id.*__maybe_unused' |xargs grep -Lw 'of_match_t=
able\|of_match_node'
drivers/cpufreq/armada-37xx-cpufreq.c
drivers/cpufreq/armada-8k-cpufreq.c
drivers/cpufreq/highbank-cpufreq.c
drivers/cpufreq/sti-cpufreq.c
drivers/hwmon/isl28022.c
drivers/input/touchscreen/stmpe-ts.c
drivers/mfd/twl6030-irq.c
drivers/tty/serial/sc16is7xx.c

I do think it makes sense to change of_match_node() to have a
reference to its arguments, as in the patch below. That
probably needs a few extra fixups.

     Arnd


diff --git a/include/linux/of.h b/include/linux/of.h
index 9d6b8a61607f..83cfa6c26ee4 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -907,7 +907,11 @@ static inline const void *of_device_get_match_data(=
const struct device *dev)
 }
=20
 #define of_match_ptr(_ptr)	NULL
-#define of_match_node(_matches, _node)	NULL
+static inline const struct of_device_id *of_match_node(
+	const struct of_device_id *matches, const struct device_node *node)
+{
+	return NULL;
+}
 #endif /* CONFIG_OF */
=20
 /* Default string compare functions, Allow arch asm/prom.h to override =
*/
diff --git a/drivers/crypto/caam/ctrl.c b/drivers/crypto/caam/ctrl.c
index d4b39184dbdb..bd418dea586d 100644
--- a/drivers/crypto/caam/ctrl.c
+++ b/drivers/crypto/caam/ctrl.c
@@ -80,7 +80,6 @@ static void build_deinstantiation_desc(u32 *desc, int =
handle)
 	append_jump(desc, JUMP_CLASS_CLASS1 | JUMP_TYPE_HALT);
 }
=20
-#ifdef CONFIG_OF
 static const struct of_device_id imx8m_machine_match[] =3D {
 	{ .compatible =3D "fsl,imx8mm", },
 	{ .compatible =3D "fsl,imx8mn", },
@@ -89,7 +88,6 @@ static const struct of_device_id imx8m_machine_match[]=
 =3D {
 	{ .compatible =3D "fsl,imx8ulp", },
 	{ }
 };
-#endif
=20
 /*
  * run_descriptor_deco0 - runs a descriptor on DECO0, under direct cont=
rol of
diff --git a/drivers/dma/dw/rzn1-dmamux.c b/drivers/dma/dw/rzn1-dmamux.c
index 4fb8508419db..9dcba3a3ffaa 100644
--- a/drivers/dma/dw/rzn1-dmamux.c
+++ b/drivers/dma/dw/rzn1-dmamux.c
@@ -104,12 +104,10 @@ static void *rzn1_dmamux_route_allocate(struct of_=
phandle_args *dma_spec,
 	return ERR_PTR(ret);
 }
=20
-#ifdef CONFIG_OF
 static const struct of_device_id rzn1_dmac_match[] =3D {
 	{ .compatible =3D "renesas,rzn1-dma" },
 	{}
 };
-#endif
=20
 static int rzn1_dmamux_probe(struct platform_device *pdev)
 {
diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c=
-at91-core.c
index edc047e3e535..3a9be06dd967 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -108,7 +108,6 @@ static const struct platform_device_id at91_twi_devt=
ypes[] =3D {
 	}
 };
=20
-#if defined(CONFIG_OF)
 static struct at91_twi_pdata at91sam9x5_config =3D {
 	.clk_max_div =3D 7,
 	.clk_offset =3D 4,
@@ -178,7 +177,6 @@ static const struct of_device_id atmel_twi_dt_ids[] =
=3D {
 	}
 };
 MODULE_DEVICE_TABLE(of, atmel_twi_dt_ids);
-#endif
=20
 static struct at91_twi_pdata *at91_twi_get_driver_data(
 					struct platform_device *pdev)
diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic=
.c
index dc1e46d834dc..969e08e4d4f4 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1409,7 +1409,6 @@ static const struct i2c_adapter xiic_adapter =3D {
 	.algo =3D &xiic_algorithm,
 };
=20
-#if defined(CONFIG_OF)
 static const struct xiic_version_data xiic_2_00 =3D {
 	.quirks =3D DYNAMIC_MODE_READ_BROKEN_BIT,
 };
@@ -1420,7 +1419,6 @@ static const struct of_device_id xiic_of_match[] =3D=
 {
 	{},
 };
 MODULE_DEVICE_TABLE(of, xiic_of_match);
-#endif
=20
 static int xiic_i2c_probe(struct platform_device *pdev)
 {
diff --git a/drivers/misc/atmel-ssc.c b/drivers/misc/atmel-ssc.c
index 35a196341534..3db592f3b451 100644
--- a/drivers/misc/atmel-ssc.c
+++ b/drivers/misc/atmel-ssc.c
@@ -111,7 +111,6 @@ static const struct platform_device_id atmel_ssc_dev=
types[] =3D {
 	}
 };
=20
-#ifdef CONFIG_OF
 static const struct of_device_id atmel_ssc_dt_ids[] =3D {
 	{
 		.compatible =3D "atmel,at91rm9200-ssc",
@@ -127,7 +126,6 @@ static const struct of_device_id atmel_ssc_dt_ids[] =
=3D {
 	}
 };
 MODULE_DEVICE_TABLE(of, atmel_ssc_dt_ids);
-#endif
=20
 static inline const struct atmel_ssc_platform_data *
 	atmel_ssc_get_driver_data(struct platform_device *pdev)
diff --git a/drivers/net/can/at91_can.c b/drivers/net/can/at91_can.c
index 191707d7e3da..9fbbf3587b0c 100644
--- a/drivers/net/can/at91_can.c
+++ b/drivers/net/can/at91_can.c
@@ -1013,7 +1013,6 @@ static const struct attribute_group at91_sysfs_att=
r_group =3D {
 	.attrs =3D at91_sysfs_attrs,
 };
=20
-#if defined(CONFIG_OF)
 static const struct of_device_id at91_can_dt_ids[] =3D {
 	{
 		.compatible =3D "atmel,at91sam9x5-can",
@@ -1026,7 +1025,6 @@ static const struct of_device_id at91_can_dt_ids[]=
 =3D {
 	}
 };
 MODULE_DEVICE_TABLE(of, at91_can_dt_ids);
-#endif
=20
 static const struct at91_devtype_data *at91_can_get_driver_data(struct =
platform_device *pdev)
 {
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethe=
rnet/cadence/macb_main.c
index 6c462de81f20..f942c6e54a1b 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4425,7 +4425,6 @@ static const struct macb_usrio_config macb_default=
_usrio =3D {
 	.refclk =3D MACB_BIT(CLKEN),
 };
=20
-#if defined(CONFIG_OF)
 /* 1518 rounded up */
 #define AT91ETHER_MAX_RBUFF_SZ	0x600
 /* max number of receive buffers */
@@ -5144,7 +5143,6 @@ static const struct of_device_id macb_dt_ids[] =3D=
 {
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, macb_dt_ids);
-#endif /* CONFIG_OF */
=20
 static const struct macb_config default_gem_config =3D {
 	.caps =3D MACB_CAPS_GIGABIT_MODE_AVAILABLE |

