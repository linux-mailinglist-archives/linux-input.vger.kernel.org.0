Return-Path: <linux-input+bounces-10745-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB59FA5E6C9
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 22:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 677993B729D
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 21:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB1C1EF393;
	Wed, 12 Mar 2025 21:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="bqzjTbkt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Erl3rH2W"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A591E5714;
	Wed, 12 Mar 2025 21:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741816673; cv=none; b=hKQOZ49H7t0JlcK3Zp6mBkwiKtEVCSAP5Dj0UJaNpm8HymvWZMex4puOCqyN03FI+b6Jkp0NYm96RziNWVmtp9mgbRx43+oXDGruOGcyNbSpKObbDrt3APhve/Ps7PRLLSbjpPSX2PDTjzCWtjaz0WFbRR6OQapTcLAWB61Brak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741816673; c=relaxed/simple;
	bh=nGcJgkCoJtQtvRizpm3fbRxdCL9kPsxqBFdpAYH9m/w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jE+ucH4Yg1yHrAjWoMk06+29n2gwWwQtGz4LiAOsGHkw7cLkkuC+TZpUciJ28Piopn13LKBBLV0yTkwl991NfVLciy/LkzPigiFeXCrp76XYeDYFaed4mKRGUqkO5d9E2x9F+y3ZJblcPW0mlkcDqU9tgcWN8yQjZj9nr8K/OFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=bqzjTbkt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Erl3rH2W; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 54DF31382D0E;
	Wed, 12 Mar 2025 17:57:50 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-02.internal (MEProxy); Wed, 12 Mar 2025 17:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1741816670;
	 x=1741903070; bh=AW3u1nv38LQ6380aEyc8+b6LZ30uxmKTmGKWtqc/wP4=; b=
	bqzjTbkt80rt8bDORRv8hCOupadvmc0+H8OwR7m4SWNny+Benxh7W1ElyaxUSGyN
	vSguJogwXEagqaps9JGIk+tJmfP4tQm/Ii+go/CZ4scrw+h6bp8af4LNRTL3BI+z
	fvTT2yuIQQdyHyQ/hb/SxT1tEqiCAyYHbA8gmoB5RJdQ44mieX7YE3r+sbuqLvBF
	cVXGhxJwRrSxnG51H8Uvoe1VnsbqtG1/Ui7VwXcbPkz2XMXS8wMBnaMXjARem6iZ
	YpOtJODSNSkodoIdpvaSBak4fVxljzk90hLQsUPwx5J3rnIk6sIpySN6pJYjMs8z
	HpvjCBH2UOG7fdeCIJi83Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741816670; x=
	1741903070; bh=AW3u1nv38LQ6380aEyc8+b6LZ30uxmKTmGKWtqc/wP4=; b=E
	rl3rH2WAG5xfo0syewwG7xC3IP4ZxYspcw3r+K2bEudQV2iYhWgSpID8qnV9yXzi
	uChKh9vVhBB7F16EeRf7R6pRjTDMGKyczNrYfZONObEyGMjfz4wGNlcbiPC7PZHT
	+EHwa+g1lU79pt53/IXFyoK+uuaZ9l9iSBvP5pwMPzmFyxQ3beaTuyFMOOe0/1zS
	a/vyEBZbL5F3XeyngVvC/oogKFR7CuHZzWxLIwsJ1c9R/lnD3Eq/ADrDwFBukLxF
	vUWbgobq0WzOzPjNntMOSGqckL+R/nW9f+fT5y3W8frZGhTP/+zH3keh4C6hn0NI
	WC4oWzbyIRNdmytkA1MFg==
X-ME-Sender: <xms:XQPSZ2dTboDqoLor48QHmFDFFXNjPVfE8vV_sV-AiLR-PyUMZRFcKA>
    <xme:XQPSZwMp0kqSci2Jff14OqDLpfsJk0FdZIRDvB4SLKztCB8q4QolSyfu5DpmN8nDC
    DDwA-5G5bbIZpc_ExA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdeivddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrd
    guvghvqeenucggtffrrghtthgvrhhnpeekvdelteefleefudffgfeukeefheeuffevveev
    teevgeevjeegtdelteffkeffheenucffohhmrghinhepghhithdqshgtmhdrtghomhdpgh
    hithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdptddurdhorhhgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvsh
    druggvvhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehmrghrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpdhrtghpthhtoh
    eplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopegsvghnthhishhssehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghp
    thhtohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprh
    gtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhi
    nhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:XgPSZ3iAeAzP8am4aYLot8WuBtePCDZ1k2a187KG7T_RhGaDBw2rcw>
    <xmx:XgPSZz_vPVbqRizicmTNT7KQ_6DGzOJwdQSF6D1nywcYc1Pex4avAg>
    <xmx:XgPSZys8qcmzwO95o5kkf-cvDpbNsnG6sEB13DcsQ8ZpqZSWWArG_Q>
    <xmx:XgPSZ6HcpysqETxCAWe9YoOGjp5P6zIEX_x73c4CqVJxHSfCBnC9DA>
    <xmx:XgPSZwB3qIlKjj3-oS7p03F0Dvq6R_TpWhtTiroYGxlbCDZTzu3uS849>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E5E403360079; Wed, 12 Mar 2025 17:57:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 13 Mar 2025 10:57:29 +1300
From: "Luke Jones" <luke@ljones.dev>
To: "kernel test robot" <lkp@intel.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 "Benjamin Tissoires" <bentiss@kernel.org>, "Jiri Kosina" <jikos@kernel.org>,
 "Mario Limonciello" <mario.limonciello@amd.com>
Message-Id: <3d8df52d-4338-4235-b1fa-183f39e3c3aa@app.fastmail.com>
In-Reply-To: <202503081003.gNlKWt4M-lkp@intel.com>
References: <20250227085817.1007697-3-luke@ljones.dev>
 <202503081003.gNlKWt4M-lkp@intel.com>
Subject: Re: [PATCH v3 2/2] platform/x86: asus-wmi: Refactor Ally suspend/resume
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Sat, 8 Mar 2025, at 3:55 PM, kernel test robot wrote:
> Hi Luke,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on hid/for-next]
> [also build test ERROR on linus/master v6.14-rc5 next-20250307]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    
> https://github.com/intel-lab-lkp/linux/commits/Luke-Jones/hid-asus-check-ROG-Ally-MCU-version-and-warn/20250227-165941
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git 
> for-next
> patch link:    
> https://lore.kernel.org/r/20250227085817.1007697-3-luke%40ljones.dev
> patch subject: [PATCH v3 2/2] platform/x86: asus-wmi: Refactor Ally 
> suspend/resume
> config: mips-allyesconfig 
> (https://download.01.org/0day-ci/archive/20250308/202503081003.gNlKWt4M-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20250308/202503081003.gNlKWt4M-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202503081003.gNlKWt4M-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers/hid/hid-asus.c:29:
>    include/linux/platform_data/x86/asus-wmi.h: In function 'set_ally_mcu_hack':
>>> include/linux/platform_data/x86/asus-wmi.h:168:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
>      168 |         return -ENODEV;
>          |                ^
>    include/linux/platform_data/x86/asus-wmi.h:166:20: note: declared 
> here
>      166 | static inline void set_ally_mcu_hack(bool enabled)
>          |                    ^~~~~~~~~~~~~~~~~
>    include/linux/platform_data/x86/asus-wmi.h: In function 
> 'set_ally_mcu_powersave':
>    include/linux/platform_data/x86/asus-wmi.h:172:16: error: 'return' 
> with a value, in function returning void [-Wreturn-mismatch]
>      172 |         return -ENODEV;
>          |                ^
>    include/linux/platform_data/x86/asus-wmi.h:170:20: note: declared 
> here
>      170 | static inline void set_ally_mcu_powersave(bool enabled)
>          |                    ^~~~~~~~~~~~~~~~~~~~~~

*Groaning sounds*.
Ilpo/Hans, you guys want me to fix this and submit new series or can this be corrected when pulled in?
There's two more of the same below this.

>
> vim +/return +168 include/linux/platform_data/x86/asus-wmi.h
>
>    159	
>    160	#if IS_REACHABLE(CONFIG_ASUS_WMI)
>    161	void set_ally_mcu_hack(bool enabled);
>    162	void set_ally_mcu_powersave(bool enabled);
>    163	int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 
> *retval);
>    164	int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, 
> u32 *retval);
>    165	#else
>    166	static inline void set_ally_mcu_hack(bool enabled)
>    167	{
>  > 168		return -ENODEV;
>    169	}
>    170	static inline void set_ally_mcu_powersave(bool enabled)
>    171	{
>    172		return -ENODEV;
>    173	}
>    174	static inline int asus_wmi_set_devstate(u32 dev_id, u32 
> ctrl_param, u32 *retval)
>    175	{
>    176		return -ENODEV;
>    177	}
>    178	static inline int asus_wmi_evaluate_method(u32 method_id, u32 
> arg0, u32 arg1,
>    179						   u32 *retval)
>    180	{
>    181		return -ENODEV;
>    182	}
>    183	#endif
>    184	
>
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

