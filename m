Return-Path: <linux-input+bounces-6851-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD0098916F
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 23:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19C141C22AF4
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 21:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E875D16132A;
	Sat, 28 Sep 2024 21:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="PXeIxw1K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S15u3jKa"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAFC136358;
	Sat, 28 Sep 2024 21:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727557394; cv=none; b=tsZvbLbfYdDZbJhSxKuBzuQWa2blmdF81ZRHz0+TUSdJH1EG1sZJwQUYSHOcc82SelXLnffiyHFyv3CKnOooLqj3KNEVZHigrQ7JAZuJG3nj7VWNXVYJ2Iypy4SwknfLJgCFC+pkuXqZW+WPGvJUraFKokdHDjknHG6U/PPBM1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727557394; c=relaxed/simple;
	bh=nM6lhYbAbYyzwJyL80Y4bCQE2lgGp7MusIiz0feOPS0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=j5/G02CKeR88Up9s9baU3Lu0i/k/Fp/gg2tBuO4gMEJwwO7+oaU6hmWdLPldhxFMc++6kVeXzLGR6KmRsG2vf598SKLdUTKzxMgTs25ca+xJKlRo7XAKw+ntsVWuAy48wZKXFm5OtpH0fLpTk4k5YxVZF7OcqcMJV68JuvOlZik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=PXeIxw1K; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S15u3jKa; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4C43511401AA;
	Sat, 28 Sep 2024 17:03:10 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Sat, 28 Sep 2024 17:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1727557390;
	 x=1727643790; bh=rt5vDgVI7RDPmKbUpmv/BiTTaPP95ZzA5dXtFam0jSY=; b=
	PXeIxw1K2HIBGDuNu9VP0jGVGkDjGBGd//UcUOGd8F5jmDSqmw/Mkk2E0b/y2t3w
	H0Bdmzg5ZL01v7le92cWxn3h5l9W0wM9KeLVdtwGjh3uJD42yz8z2ccUoXWTZfLf
	ZB5o3De365qbRMW87nt8W7DLGfyn/4cf/S3yUfDpWxOJBNgYdt/iYgdsuiAip9dH
	bTgsf+rRnH9vsNTX7cOVeRZJ2MMjfN2GOkwvedvhln1tvqYkb3WRnqFlVawD7yJR
	GZStOkKa6uEZFR7YW9Qh1DPflU0TC8aujQlTOhlSpalotxFheoFqxdHziloJHpSZ
	Ncm0l+IN6mbGJRnqqBL5wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727557390; x=
	1727643790; bh=rt5vDgVI7RDPmKbUpmv/BiTTaPP95ZzA5dXtFam0jSY=; b=S
	15u3jKa4IR1BUjQkqBFFdE8bgzpxiLX1qva3mzwtmNDMt426N+WRqzn9/glhy1OU
	bDFZ/eeIqBENxSuf8WbYflmi/Hld2MJPrJkrzoI40iFDMdKEyTFFTQDhsUOCdeNH
	D2GhGPWMYqFoqY1YVzRaCk1oGNUx66vjePHx8sBpLNrU599GOcmU3Illo1GSZmlR
	r9QVoOxozRuQUL2lh5JruEL53cVEu9VR+67+9b8NtuJe+dWdmt+eiRLYP/kfuvu5
	uM0xaGkua/2Xhqaz/QpRv5KhEa4vm4GkkPxdBnMwC2FF9e58YMFL8uzB2ILyu2e8
	sfGJl+jwo38eNrPLPmxnA==
X-ME-Sender: <xms:DW_4ZvpJ0QOtFAj8IPYhKyWJGhHKh84nbFEivfOfMmriuJb_XUaMbQ>
    <xme:DW_4Zpo3Ae-y08dFs-GDR2NkEKdPHecLypqZXdjJTj7458C8SYrqUY-lNTzE3mWJ7
    FFCvl-usXnIVxEAP50>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduuddgudeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfnuhhkvgculfhonhgvshdfuceolhhukhgvsehljhhonhgvshdrug
    gvvheqnecuggftrfgrthhtvghrnhepkedvleetfeelfedufffgueekfeehueffveevveet
    veegveejgedtleetffekffehnecuffhomhgrihhnpehgihhtqdhstghmrdgtohhmpdhgih
    hthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgpddtuddrohhrghenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrd
    guvghvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheptghorhgvnhhtihhnrdgthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplh
    hkphesihhnthgvlhdrtghomhdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hsuhhpvghrmhdusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhv
    ihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepohgvqdhksghuih
    hlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehhuggvghho
    vgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:DW_4ZsNg0aBU_ShRZJlhecDjmjT97Wpu5jCf-fi7JhYhkkv6U1ILyA>
    <xmx:DW_4Zi7RvCjYrA3B97msssLj2zOAM5Zamp-YHKN3Y_MpP6hzqo17Xg>
    <xmx:DW_4Zu4oAPORQm_9ObhQkrEGy6XId7wrH6XtxrdhF-flsuBo3WljjQ>
    <xmx:DW_4ZqjdJTzz8fLvOiUUeRlFn15dzq__NHpBdVr5rMNU2eaNo1eMYA>
    <xmx:Dm_4ZnGZgPcBoF2b5NHc-PXQaOfmAd6YoO3MMAYwto3vd5nIhNh7Yrr4>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A80453360077; Sat, 28 Sep 2024 17:03:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 29 Sep 2024 10:02:48 +1300
From: "Luke Jones" <luke@ljones.dev>
To: "kernel test robot" <lkp@intel.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
 "Benjamin Tissoires" <bentiss@kernel.org>, "Jiri Kosina" <jikos@kernel.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com,
 "Mario Limonciello" <superm1@kernel.org>
Message-Id: <f5ce9899-a5b8-43e1-97cf-086f51230b8d@app.fastmail.com>
In-Reply-To: <202409280735.meXnoMkl-lkp@intel.com>
References: <20240926092952.1284435-10-luke@ljones.dev>
 <202409280735.meXnoMkl-lkp@intel.com>
Subject: Re: [PATCH v4 9/9] platform/x86: asus-wmi: deprecate bios features
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Sat, 28 Sep 2024, at 12:13 PM, kernel test robot wrote:
> Hi Luke,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on hid/for-next]
> [also build test WARNING on linus/master next-20240927]
> [cannot apply to v6.11]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    
> https://github.com/intel-lab-lkp/linux/commits/Luke-D-Jones/platform-x86-asus-wmi-export-symbols-used-for-read-write-WMI/20240926-173528
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git 
> for-next
> patch link:    
> https://lore.kernel.org/r/20240926092952.1284435-10-luke%40ljones.dev
> patch subject: [PATCH v4 9/9] platform/x86: asus-wmi: deprecate bios 
> features
> config: i386-randconfig-061-20240928 
> (https://download.01.org/0day-ci/archive/20240928/202409280735.meXnoMkl-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 
> 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20240928/202409280735.meXnoMkl-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202409280735.meXnoMkl-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/platform/x86/asus-wmi.c:154:35: warning: unused variable 'asus_ally_mcu_quirk' [-Wunused-const-variable]
>      154 | static const struct dmi_system_id asus_ally_mcu_quirk[] = {
>          |                                   ^~~~~~~~~~~~~~~~~~~
>    1 warning generated.


Not sure where this is coming from but it can be cleaned up by https://lore.kernel.org/platform-driver-x86/c19f3530-a065-461f-a5bf-ccc3988cf24c@amd.com/T/#t v2

>
> vim +/asus_ally_mcu_quirk +154 drivers/platform/x86/asus-wmi.c
>
> 0f0ac158d28ff7 Luke D. Jones 2021-10-24  153  
> d2dfed310aae07 Luke D. Jones 2024-08-06 @154  static const struct 
> dmi_system_id asus_ally_mcu_quirk[] = {
> d2dfed310aae07 Luke D. Jones 2024-08-06  155  	{
> d2dfed310aae07 Luke D. Jones 2024-08-06  156  		.matches = {
> d2dfed310aae07 Luke D. Jones 2024-08-06  157  
> 			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> d2dfed310aae07 Luke D. Jones 2024-08-06  158  		},
> d2dfed310aae07 Luke D. Jones 2024-08-06  159  	},
> d2dfed310aae07 Luke D. Jones 2024-08-06  160  	{
> d2dfed310aae07 Luke D. Jones 2024-08-06  161  		.matches = {
> d2dfed310aae07 Luke D. Jones 2024-08-06  162  
> 			DMI_MATCH(DMI_BOARD_NAME, "RC72L"),
> d2dfed310aae07 Luke D. Jones 2024-08-06  163  		},
> d2dfed310aae07 Luke D. Jones 2024-08-06  164  	},
> d2dfed310aae07 Luke D. Jones 2024-08-06  165  	{ },
> d2dfed310aae07 Luke D. Jones 2024-08-06  166  };
> d2dfed310aae07 Luke D. Jones 2024-08-06  167  
>
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

