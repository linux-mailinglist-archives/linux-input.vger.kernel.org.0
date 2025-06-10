Return-Path: <linux-input+bounces-12745-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 492D9AD2AE8
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 02:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6E5618916F9
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 00:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28260382;
	Tue, 10 Jun 2025 00:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="g5UsHtnC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LmxloUtJ"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1768928F3;
	Tue, 10 Jun 2025 00:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749515444; cv=none; b=VoArFaPq/LjysYjr17BnvnXNRw+GtJMdcJr9p5gqd4g7SP25hyDm6etQKW0KZ3n+zb3Uc8d7VVG7UPChN+HMBweYtkJsGQD6r6D6CRgda/1j7VMUn9a7aRAKaWmjTrj1iprLkV0zv6B2iRomMeny5di2Lr88pPB9hMWB6OTgQqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749515444; c=relaxed/simple;
	bh=QAABkK/hUO00ev7kPuwpyfQzF2qyqrw4Augc8CAylWw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VNuXWMi3KsDwHGC03MkRdoZrR/PpGNuwaiiBddvQR0chlhFxN65owzzvWsjXqE33njmcyrPsTbe/oIzQio2Pgdtz+QWIgnS0lMsoB/wWfWTaXFZbPXdxfR+FBYhh0E8BeaoD9rnjhqvbwcr9DEfwEntIfEMiP1YvBLtjBI/i8wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=g5UsHtnC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LmxloUtJ; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1DE6511402E4;
	Mon,  9 Jun 2025 20:30:40 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-06.internal (MEProxy); Mon, 09 Jun 2025 20:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1749515440;
	 x=1749601840; bh=u3Lnolb/bkfH724TgvdoxKe0DiPi9kBQBwvy0d2oehw=; b=
	g5UsHtnCnCg/cgT+JsNUZScyOKzP+upfC5oNdhNBVOBYwggedDExwNNBorLj19GZ
	H6NmtVj81v1PZnzCZCd9hZ/4h2JG5NEUaBpghiepTJyoOsa/AB7Rmhh5J/3WHg2u
	X7+PkV6XH3agErMtbLPcbbGgpO7EAJChT82djq9tvxt6RvmlpJK7kEFQDnPtLlc3
	qbp1C+XPyKJ2E7cdal9lEqcQ9Pc/mc1yiFB2XjDQ6GV6OqB9TlS97eHik0bp21En
	8AfyTS7vRMiMFJx/fGmIyii92LwKlPoCe4HuaEO+E41nG/WopgCmWgnkZYHNIWhN
	5I5OtsnKkqVsPHvOBg9Hbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749515440; x=
	1749601840; bh=u3Lnolb/bkfH724TgvdoxKe0DiPi9kBQBwvy0d2oehw=; b=L
	mxloUtJ2rAHVeJJmbtxwD/nDSscbm/TccSotyBfABIt8ibqUuV8wFcMaAGeEzpos
	hhX/AO4OH20IZhR9IfzRTfx3E2WgPpWRsRRelrp0l3niaC+ClXdacsMWTglMnvf9
	eiUKOC0zs+PVGEwERc+GNg/u0gpQjugUjQSOr7cCQZBk8xhJwWot3R9ADB5QhqsW
	x2Mhe6O6BthFgIb4LwvcjVpJBf7PZfzk6JOFbpSupNpULg6nqwLdNjjio2wyWaIb
	W2PBU5DFwK3lpaRgGYwVsX8haTrpcwq+vw9uG/2t3j3+J2yb3Q6NQSrMOXFvcIva
	9CituQfyGpmd2/XKuTNDg==
X-ME-Sender: <xms:r3xHaJ7XNybG2OGFZCzFXhGkKeYkCoQZq_Sr6jUfWM8uuV7WPrPE7Q>
    <xme:r3xHaG7eHIPIg5kWoiuqSeHoMwGd2K1wVympZuz0CitcoNvD-xmDaOwnSoe0budtd
    bzwj_ClVI3ygblPBX4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfnuhhkvgculfhonhgvshdfuceolhhukhgvsehljhhonhgvshdrug
    gvvheqnecuggftrfgrthhtvghrnhepvdehudevieelvdejvdejkefhfeekfeeijedujeff
    tddtveekhefgudefgefgvddunecuffhomhgrihhnpehlkhhmlhdrohhrghdpkhgvrhhnvg
    hlrdhorhhgpddtuddrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhope
    dutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhhuuhhrthgssehgmhgrihhl
    rdgtohhmpdhrtghpthhtoheptghhrghithgrnhihrgdrkhhumhgrrhdrsghorhgrhhesih
    hnthgvlhdrtghomhdprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehinhhtvghlrdgt
    ohhmpdhrtghpthhtohepjhgrnhhirdhsrggrrhhinhgvnhesihhnthgvlhdrtghomhdprh
    gtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrtghomhdprhgtphht
    thhopehsuhhrvghshhdrkhhumhgrrhdrkhhurhhmihesihhnthgvlhdrtghomhdprhgtph
    htthhopehinhhtvghlqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
    pdhrtghpthhtohepihhnthgvlhdqgigvsehlihhsthhsrdhfrhgvvgguvghskhhtohhprd
    horhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:r3xHaAfh6Su4wFHDKGfkJ9V-BC_UWgOn4ZqWtxWaJSivNhWOz-46xQ>
    <xmx:r3xHaCKGGJwMhy-aeLr80VEjrm7YcF_ZVF50XOdQgPUUvwLcL2QFvg>
    <xmx:r3xHaNJsj94Pgxy07Z6PTCp9zkhwHzvejotJnUdsa_2cK-Sf0zK30w>
    <xmx:r3xHaLydVI3uSp8y6mnFIyof4OvYk79GU6mXa1HclBd-D_cAoCdQnw>
    <xmx:sHxHaOcpL7ytAftgUQe7g5nKZock0iv81eQeBLFFASTLA4-I6gbHoQX8>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BFA25780075; Mon,  9 Jun 2025 20:30:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T4bdae7bed362e7f1
Date: Tue, 10 Jun 2025 12:30:18 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>,
 "Kurt Borja" <kuurtb@gmail.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Jani Saarinen" <jani.saarinen@intel.com>,
 "Suresh Kumar Kurmi" <suresh.kumar.kurmi@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Jani Nikula" <jani.nikula@intel.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <b2feef03-ffaf-4172-9d00-09e3e37310ed@app.fastmail.com>
In-Reply-To: 
 <SJ1PR11MB612904F9F3109473838EE36BB96BA@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: 
 <SJ1PR11MB6129F730EEDCD051DAD8A5DCB967A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <0325a50d-8499-4602-aa8c-67445b626587@app.fastmail.com>
 <DA7WOJH0HZDH.36EH3U8BQJ0JF@gmail.com>
 <SJ1PR11MB612904F9F3109473838EE36BB96BA@SJ1PR11MB6129.namprd11.prod.outlook.com>
Subject: Re: [REGRESSION] on linux-next (next-20250509)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Jun 2025, at 11:06 PM, Borah, Chaitanya Kumar wrote:
> Hi Luke,
>
>
>> -----Original Message-----
>> From: Kurt Borja <kuurtb@gmail.com>
>> Sent: Wednesday, May 28, 2025 9:11 PM
>> To: Luke Jones <luke@ljones.dev>; Borah, Chaitanya Kumar
>> <chaitanya.kumar.borah@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; =
Saarinen,
>> Jani <jani.saarinen@intel.com>; Kurmi, Suresh Kumar
>> <suresh.kumar.kurmi@intel.com>; De Marchi, Lucas
>> <lucas.demarchi@intel.com>; Nikula, Jani <jani.nikula@intel.com>; lin=
ux-
>> input@vger.kernel.org; platform-driver-x86@vger.kernel.org
>> Subject: Re: [REGRESSSION] on linux-next (next-20250509)
>>=20
>> Hi Luke,
>>=20
>> On Wed May 28, 2025 at 10:07 AM -03, Luke Jones wrote:
>> > On Wed, 28 May 2025, at 12:08 PM, Borah, Chaitanya Kumar wrote:
>> >> Hello Luke,
>> >>
>> >> Hope you are doing well. I am Chaitanya from the linux graphics te=
am in
>> Intel.
>> >>
>> >> This mail is regarding a regression we are seeing in our CI runs[1]
>> >> on linux-next repository.
>> >
>> > Can you tell me if the fix here was included?
>> > https://lkml.org/lkml/2025/5/24/152
>> >
>> > I could change to:
>> > static void asus_s2idle_check_register(void) {
>> >     // Only register for Ally devices
>> >     if (dmi_check_system(asus_rog_ally_device)) {
>> >         if (acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops))
>> >             pr_warn("failed to register LPS0 sleep handler in asus-=
wmi\n");
>> >     }
>> > }
>> >
>> > but I don't really understand what is happening here. The inner lps0
>> functions won't run unless use_ally_mcu_hack is set.
>>=20
>> The RIP is caused by a "list_add double add" warning.
>>=20
>> After reading the log, I believe this is happening because
>> asus_wmi_register_driver() is called a second time by eeepc_wmi after
>> asus_nb_wmi, which implies
>>=20
>> 	asus_wmi_probe()
>> 	  -> acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops)
>>=20
>> is called twice and the warning is triggered.
>>=20
>> Line [1] makes me think this could be a race condition, as
>> asus_wmi_register_driver() may be called concurrently.
>>=20
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-dr=
ivers-
>> x86.git/tree/drivers/platform/x86/asus-wmi.c?h=3Dfor-next#n5101
>>=20
>
> Any update on this? It has now hit  6.16-rc1
>
> https://intel-gfx-ci.01.org/tree/drm-tip/igt@runner@aborted.html

I will send a patch asap. Haven't been able to do so with work and 3 day=
s of flights.

> Regards
>
> Chaitanya
>
>> >
>> > I will do my best to fix but I need to understand what happened a b=
it better.
>> >
>> > regards,
>> > Luke.
>> >
>> >> Since the version next-20250509 [2], we are seeing the following
>> >> regression
>> >>
>> >> ``````````````````````````````````````````````````````````````````=
```````````````
>> >> <4>[    5.400826] ------------[ cut here ]------------
>> >> <4>[    5.400832] list_add double add: new=3Dffffffffa07c0ca0,
>> >> prev=3Dffffffff837e9a60, next=3Dffffffffa07c0ca0.
>> >> <4>[    5.400845] WARNING: CPU: 0 PID: 379 at lib/list_debug.c:35
>> >> __list_add_valid_or_report+0xdc/0xf0
>> >> <4>[    5.400850] Modules linked in: cmdlinepart(+) eeepc_wmi(+)
>> >> asus_nb_wmi(+) asus_wmi spi_nor(+) sparse_keymap mei_pxp mtd
>> >> platform_profile kvm_intel(+) mei_hdcp wmi_bmof kvm irqbypass
>> >> polyval_clmulni usbhid ghash_clmulni_intel snd_hda_intel hid
>> >> sha1_ssse3
>> >> r8152(+) binfmt_misc aesni_intel snd_intel_dspcfg mii r8169
>> >> snd_hda_codec rapl video snd_hda_core intel_cstate snd_hwdep realt=
ek
>> >> snd_pcm snd_timer mei_me snd i2c_i801 i2c_mux spi_intel_pci idma64
>> >> soundcore spi_intel i2c_smbus mei intel_pmc_core nls_iso8859_1
>> >> pmt_telemetry pmt_class intel_pmc_ssram_telemetry pinctrl_alderlake
>> >> intel_vsec acpi_tad wmi acpi_pad dm_multipath msr nvme_fabrics fuse
>> >> efi_pstore nfnetlink ip_tables x_tables autofs4
>> >> <4>[    5.400904] CPU: 0 UID: 0 PID: 379 Comm: (udev-worker) Taint=
ed: G
>> >> S
>> >> 6.15.0-rc7-next-20250526-next-20250526-g3be1a7a31fbd+ #1
>> >> PREEMPT(voluntary)
>> >> <4>[    5.400907] Tainted: [S]=3DCPU_OUT_OF_SPEC
>> >> <4>[    5.400908] Hardware name: ASUS System Product Name/PRIME
>> Z790-P
>> >> WIFI, BIOS 0812 02/24/2023
>> >> <4>[    5.400909] RIP: 0010:__list_add_valid_or_report+0xdc/0xf0
>> >> <4>[    5.400912] Code: 16 48 89 f1 4c 89 e6 e8 a2 c5 5f ff 0f 0b =
31 c0
>> >> e9 72 ff ff ff 48 89 f2 4c 89 e1 48 89 fe 48 c7 c7 68 ba 0f 83 e8 =
84
>> >> c5 5f ff <0f> 0b 31 c0 e9 54 ff ff ff 66 66 2e 0f 1f 84 00 00 00 00
>> >> 00 90
>> >> 90
>> >> <4>[    5.400914] RSP: 0018:ffffc90002763588 EFLAGS: 00010246
>> >> <4>[    5.400916] RAX: 0000000000000000 RBX: ffffffffa07c0ca0 RCX:
>> >> 0000000000000000
>> >> <4>[    5.400918] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
>> >> 0000000000000000
>> >> <4>[    5.400919] RBP: ffffc90002763598 R08: 0000000000000000 R09:
>> >> 0000000000000000
>> >> <4>[    5.400920] R10: 0000000000000000 R11: 0000000000000000 R12:
>> >> ffffffffa07c0ca0
>> >> <4>[    5.400921] R13: ffffffffa07c0ca0 R14: 0000000000000000 R15:
>> >> ffff8881212d6da0
>> >> <4>[    5.400923] FS:  0000778637b418c0(0000) GS:ffff8888dad0c000(=
0000)
>> >> knlGS:0000000000000000
>> >> <4>[    5.400926] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> >> <4>[    5.400928] CR2: 00007786373b80b2 CR3: 0000000116faa000 CR4:
>> >> 0000000000f50ef0
>> >> <4>[    5.400931] PKRU: 55555554
>> >> <4>[    5.400933] Call Trace:
>> >> <4>[    5.400935]  <TASK>
>> >> <4>[    5.400937]  ? lock_system_sleep+0x2b/0x40
>> >> <4>[    5.400942]  acpi_register_lps0_dev+0x58/0xb0
>> >> <4>[    5.400949]  asus_wmi_probe+0x7f/0x1930 [asus_wmi]
>> >> <4>[    5.400956]  ? kernfs_create_link+0x69/0xe0
>> >> ``````````````````````````````````````````````````````````````````=
```
>> >> ````````````
>> >> Detailed log can be found in [3].
>> >>
>> >> After bisecting the tree, the following patch [4] seems to be the =
first "bad"
>> >> commit
>> >>
>> >> ``````````````````````````````````````````````````````````````````=
```
>> >> ````````````````````````````````````
>> >> commit feea7bd6b02d43a794e3f065650d89cf8d8e8e59
>> >> Author: Luke D. Jones mailto:luke@ljones.dev
>> >> Date:=C2=A0=C2=A0 Sun Mar 23 15:34:21 2025 +1300
>> >>
>> >> =C2=A0=C2=A0=C2=A0 platform/x86: asus-wmi: Refactor Ally suspend/r=
esume
>> >> ``````````````````````````````````````````````````````````````````=
```
>> >> ````````````````````````````````````
>> >>
>> >> We could not revert the patch because of merge conflict but resett=
ing
>> >> to the parent of the commit seems to fix the issue
>> >>
>> >> Could you please check why the patch causes this regression and
>> >> provide a fix if necessary?
>> >>
>> >> Thank you.
>> >>
>> >> Regards
>> >>
>> >> Chaitanya
>> >>
>> >> [1] https://intel-gfx-ci.01.org/tree/linux-next/combined-alt.html?
>> >> [2]
>> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.gi=
t/c
>> >> ommit/?h=3Dnext-20250509
>> >> [3]
>> >> https://intel-gfx-ci.01.org/tree/linux-next/next-20250526/bat-rpls=
-4/
>> >> boot0.txt
>> >> [4]
>> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.gi=
t/c
>> >> ommit/?h=3Dnext-
>> 20250509&id=3Dfeea7bd6b02d43a794e3f065650d89cf8d8e8e59
>>=20
>>=20
>> --
>>  ~ Kurt

