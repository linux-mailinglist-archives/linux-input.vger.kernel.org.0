Return-Path: <linux-input+bounces-12621-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29810AC69FF
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 15:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDFA84A646C
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 13:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F90283C86;
	Wed, 28 May 2025 13:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="yx1gaKhE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VhFEsxKb"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA4F279796;
	Wed, 28 May 2025 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748437696; cv=none; b=hmlCg5wMQgzGmueB1M12UxnCxdLJt0oT4w3d6LLaPMW/QTokLHgoGgLVl0U2PRLgTmy+ouprhuL9vS/VAl+4FCLozV1BLvb+0yJ3C6NmUtvbZyRroyOOdKD8/nIDxrg9lWHnOb+DSWY8efKnwuiHr/NjK6P+dTbRL+avQq9Zco4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748437696; c=relaxed/simple;
	bh=SKXsssFM41JTC2gaCfx4SQKtyLz5wZGPp0cgG0XBZ7g=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=BkSePK4GP2HY8XiI3bhiwPZ8msDj7M8WDUV2Jb3wo3Ao/hrI35KBY9pyCi+KaGqTy8tBiyjr7VoH43NUS13TBp5xjJshhcPwVSAb/z9RpOU3x9cWBWv9w+imkCtYOpHAx9mPtBYW2ySW8ZqHo2JryiZyrWtbyQ3ETevsL+iNHBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=yx1gaKhE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VhFEsxKb; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 770AE1140154;
	Wed, 28 May 2025 09:08:12 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-06.internal (MEProxy); Wed, 28 May 2025 09:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1748437692;
	 x=1748524092; bh=P3wS2hHSppU0mSKPs0YAqDamY9Rvl8W25s48imdCn4c=; b=
	yx1gaKhEwm0WfMgos9EXeZmG3V9w1vDxmJKUei1Duvxg647jScpXayj8mhWIh62z
	7myEs35lKUEtA2iTGQ9NEUgBT7jcmsRaZ6XY6CsLZy8WOMdi6SkzC8Qe1XrKMrrg
	BvX5y079GGL/qcEzbybtm4UdkGklK6rNgLJ1dGpi9v6EEWlPgmoSTCplSQgUb+py
	MkMN4d9Rgy4KAAOm3mwsnSDgKtpn2OoeHTGuy96LKMUBw5NNeqRd0VzFYWu2FLOl
	DlORBapABm4h90hDAiKj5aVhHniL3fI8DF0WWV5iLKgMU1HQoqrZwU1/dDQEgcR/
	kDabyYIFO5o8QoQd4HArTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748437692; x=
	1748524092; bh=P3wS2hHSppU0mSKPs0YAqDamY9Rvl8W25s48imdCn4c=; b=V
	hFEsxKb9xnn+hEmyX+Eiy1IBRgkRHc/SU671MwyM0L+E6pxvDwefdstgDXe18lAW
	e+ZvOrQLmA779DQB8o4+ZYaIWNKAsZXyUo3kd2SAtoh/RhfGZKyWfT27oG4xPOcc
	eDTnS+oZgA5p3iPXeuiNS5NIHwcWeRNojYqXgnoLhNOb55OBrElX34I9CoHwW4lj
	6bMKNC4ta67LoseZ3tF04fJk5UVNG9Z9hgTJNye7Gm5wSdyepNDtMXQ5aQEIk5Ju
	+12znHw4mxKhTZYNbOSSzsL8DCAngcgGEFvB7qHAmztb3saN1qrcLHc7lS3SqRzh
	KpBl7dFY4oxNxDEdTPgkA==
X-ME-Sender: <xms:uwo3aL-D-_gVsOoxNZCeatb5QFZ8LnUFIlGp7mW59FHgTFNDegMHsQ>
    <xme:uwo3aHvOflm1b0_2NAghj4JlwSgXQXmIOvTti8LWM_-fGkmqKKHW7cI3O6qWHQ-Dx
    r1TMUgd2IxWvCF0sSI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeeffeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthhqredtredtjeenucfhrhhomhepfdfnuhhkvgculfhonhgvshdfuceolh
    hukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgedvhefhveevkeel
    hefhleeuheefteeijedtvdekledvjeekfedtgfefvdevgfdvnecuffhomhgrihhnpehlkh
    hmlhdrohhrghdptddurdhorhhgpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvg
    hvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegt
    hhgrihhtrghnhigrrdhkuhhmrghrrdgsohhrrghhsehinhhtvghlrdgtohhmpdhrtghpth
    htohepjhgrnhhirdhnihhkuhhlrgesihhnthgvlhdrtghomhdprhgtphhtthhopehjrghn
    ihdrshgrrghrihhnvghnsehinhhtvghlrdgtohhmpdhrtghpthhtoheplhhutggrshdrug
    gvmhgrrhgthhhisehinhhtvghlrdgtohhmpdhrtghpthhtohepshhurhgvshhhrdhkuhhm
    rghrrdhkuhhrmhhisehinhhtvghlrdgtohhmpdhrtghpthhtohepihhnthgvlhdqghhfgi
    eslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehinhhtvghl
    qdigvgeslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhl
    rghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:uwo3aJDERAOtO_Tg0nInJ9CmtutuDq3VAR_aQ0TKV_CpIjK9YsoVsw>
    <xmx:vAo3aHd9hIaLNFPfPFhVgfBCmjzxQSlNYMHVFRmJKjP1uDi3BGyc0Q>
    <xmx:vAo3aAMaGmd_1dZRaW8dD_7jIiV5kthsgegdyJ0548BE7cDQPBbIhw>
    <xmx:vAo3aJlhJm-BNM5u_Bii_djGlMp1rBd7sBqun9aurDJ3kanClh-a7Q>
    <xmx:vAo3aE0zYkxkLN1OHqQUlFGKd-eV17ELQhO1wXd6-ukVCC26OpWwR62c>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D9676780070; Wed, 28 May 2025 09:08:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T4bdae7bed362e7f1
Date: Wed, 28 May 2025 15:07:51 +0200
From: "Luke Jones" <luke@ljones.dev>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <0325a50d-8499-4602-aa8c-67445b626587@app.fastmail.com>
In-Reply-To: 
 <SJ1PR11MB6129F730EEDCD051DAD8A5DCB967A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: 
 <SJ1PR11MB6129F730EEDCD051DAD8A5DCB967A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Subject: Re: [REGRESSSION] on linux-next (next-20250509)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 28 May 2025, at 12:08 PM, Borah, Chaitanya Kumar wrote:
> Hello Luke,
>
> Hope you are doing well. I am Chaitanya from the linux graphics team i=
n Intel.
>
> This mail is regarding a regression we are seeing in our CI runs[1] on=20
> linux-next repository.

Can you tell me if the fix here was included?
https://lkml.org/lkml/2025/5/24/152

I could change to:
static void asus_s2idle_check_register(void)
{
    // Only register for Ally devices
    if (dmi_check_system(asus_rog_ally_device)) {
        if (acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops))
            pr_warn("failed to register LPS0 sleep handler in asus-wmi\n=
");
    }
}

but I don't really understand what is happening here. The inner lps0 fun=
ctions won't run unless use_ally_mcu_hack is set.

I will do my best to fix but I need to understand what happened a bit be=
tter.

regards,
Luke.

> Since the version next-20250509 [2], we are seeing the following regre=
ssion
>
> ``````````````````````````````````````````````````````````````````````=
```````````
> <4>[    5.400826] ------------[ cut here ]------------
> <4>[    5.400832] list_add double add: new=3Dffffffffa07c0ca0,=20
> prev=3Dffffffff837e9a60, next=3Dffffffffa07c0ca0.
> <4>[    5.400845] WARNING: CPU: 0 PID: 379 at lib/list_debug.c:35=20
> __list_add_valid_or_report+0xdc/0xf0
> <4>[    5.400850] Modules linked in: cmdlinepart(+) eeepc_wmi(+)=20
> asus_nb_wmi(+) asus_wmi spi_nor(+) sparse_keymap mei_pxp mtd=20
> platform_profile kvm_intel(+) mei_hdcp wmi_bmof kvm irqbypass=20
> polyval_clmulni usbhid ghash_clmulni_intel snd_hda_intel hid sha1_ssse=
3=20
> r8152(+) binfmt_misc aesni_intel snd_intel_dspcfg mii r8169=20
> snd_hda_codec rapl video snd_hda_core intel_cstate snd_hwdep realtek=20
> snd_pcm snd_timer mei_me snd i2c_i801 i2c_mux spi_intel_pci idma64=20
> soundcore spi_intel i2c_smbus mei intel_pmc_core nls_iso8859_1=20
> pmt_telemetry pmt_class intel_pmc_ssram_telemetry pinctrl_alderlake=20
> intel_vsec acpi_tad wmi acpi_pad dm_multipath msr nvme_fabrics fuse=20
> efi_pstore nfnetlink ip_tables x_tables autofs4
> <4>[    5.400904] CPU: 0 UID: 0 PID: 379 Comm: (udev-worker) Tainted: =
G=20
> S                 =20
> 6.15.0-rc7-next-20250526-next-20250526-g3be1a7a31fbd+ #1=20
> PREEMPT(voluntary)=20
> <4>[    5.400907] Tainted: [S]=3DCPU_OUT_OF_SPEC
> <4>[    5.400908] Hardware name: ASUS System Product Name/PRIME Z790-P=20
> WIFI, BIOS 0812 02/24/2023
> <4>[    5.400909] RIP: 0010:__list_add_valid_or_report+0xdc/0xf0
> <4>[    5.400912] Code: 16 48 89 f1 4c 89 e6 e8 a2 c5 5f ff 0f 0b 31 c=
0=20
> e9 72 ff ff ff 48 89 f2 4c 89 e1 48 89 fe 48 c7 c7 68 ba 0f 83 e8 84 c=
5=20
> 5f ff <0f> 0b 31 c0 e9 54 ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 90=20
> 90
> <4>[    5.400914] RSP: 0018:ffffc90002763588 EFLAGS: 00010246
> <4>[    5.400916] RAX: 0000000000000000 RBX: ffffffffa07c0ca0 RCX:=20
> 0000000000000000
> <4>[    5.400918] RDX: 0000000000000000 RSI: 0000000000000000 RDI:=20
> 0000000000000000
> <4>[    5.400919] RBP: ffffc90002763598 R08: 0000000000000000 R09:=20
> 0000000000000000
> <4>[    5.400920] R10: 0000000000000000 R11: 0000000000000000 R12:=20
> ffffffffa07c0ca0
> <4>[    5.400921] R13: ffffffffa07c0ca0 R14: 0000000000000000 R15:=20
> ffff8881212d6da0
> <4>[    5.400923] FS:  0000778637b418c0(0000) GS:ffff8888dad0c000(0000=
)=20
> knlGS:0000000000000000
> <4>[    5.400926] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[    5.400928] CR2: 00007786373b80b2 CR3: 0000000116faa000 CR4:=20
> 0000000000f50ef0
> <4>[    5.400931] PKRU: 55555554
> <4>[    5.400933] Call Trace:
> <4>[    5.400935]  <TASK>
> <4>[    5.400937]  ? lock_system_sleep+0x2b/0x40
> <4>[    5.400942]  acpi_register_lps0_dev+0x58/0xb0
> <4>[    5.400949]  asus_wmi_probe+0x7f/0x1930 [asus_wmi]
> <4>[    5.400956]  ? kernfs_create_link+0x69/0xe0
> ``````````````````````````````````````````````````````````````````````=
```````````
> Detailed log can be found in [3].
>
> After bisecting the tree, the following patch [4] seems to be the firs=
t "bad"
> commit
>
> ``````````````````````````````````````````````````````````````````````=
```````````````````````````````````
> commit feea7bd6b02d43a794e3f065650d89cf8d8e8e59
> Author: Luke D. Jones mailto:luke@ljones.dev
> Date:=C2=A0=C2=A0 Sun Mar 23 15:34:21 2025 +1300
>
> =C2=A0=C2=A0=C2=A0 platform/x86: asus-wmi: Refactor Ally suspend/resume
> ``````````````````````````````````````````````````````````````````````=
```````````````````````````````````
>
> We could not revert the patch because of merge conflict but resetting=20
> to the parent of the commit seems to fix the issue
>
> Could you please check why the patch causes this regression and provid=
e=20
> a fix if necessary?
>
> Thank you.
>
> Regards
>
> Chaitanya
>
> [1] https://intel-gfx-ci.01.org/tree/linux-next/combined-alt.html?
> [2]=20
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/co=
mmit/?h=3Dnext-20250509=20
> [3]=20
> https://intel-gfx-ci.01.org/tree/linux-next/next-20250526/bat-rpls-4/b=
oot0.txt=20
> [4]=20
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/co=
mmit/?h=3Dnext-20250509&id=3Dfeea7bd6b02d43a794e3f065650d89cf8d8e8e59

