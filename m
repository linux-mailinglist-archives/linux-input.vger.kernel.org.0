Return-Path: <linux-input+bounces-7770-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB3D9B669E
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 15:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EBBA1C21577
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 14:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79EE1F4FA1;
	Wed, 30 Oct 2024 14:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="LczOott2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UJSmaFiJ"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2D81F473D;
	Wed, 30 Oct 2024 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730300177; cv=none; b=gSwVp8tWEDIyrWweDT7IWf9eVWsWp6ySz0EKhH42nYRjgNKGDqO6d7XqD6VvqjKaUMsvCQZe7NcFo1aaSZzG9XzPdwjKya296sdEdpQCsW2dLTbLs29uFG3c3jc/Fg5hikmYG0BSyJyoREqG4ADSxrVx6bxcNsSFrtOSP6E53do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730300177; c=relaxed/simple;
	bh=XwvcOOfZOMY4BiPVUa4DIiTgiA1HZ11ISi29OEZBzg8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eZie9bw2WnSIGge6IIkQjkpWoNf2Qj148PQxYr2euCWkNSdCmKW7pcD3suLXHrt8a2TVh+nrT44rUhO99bcVmWCCFrrTg32/YDltDsi780m9NS/YmVWRx8D/A5iYV19VcBMqAnoC8DgnSerdZha7hNXEtAqx99SrNGBBH7kZw8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=LczOott2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UJSmaFiJ; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 3DD361140101;
	Wed, 30 Oct 2024 10:56:13 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Wed, 30 Oct 2024 10:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1730300173;
	 x=1730386573; bh=tmIwzhdVEu36U+11NzuePr0At4eBbi9WRuSznp86bBs=; b=
	LczOott29S5ugCmQJccz6hDnenikTFjcV0kSt2D9tNKKQTpEAtkRkGUhgchdN56N
	SrwVGSeNi/bbz9UpYQvvW95UPvlpB7+Kwo1UnqsQq1kSjfYFNJF42liumhPtWFwz
	4I9PENEWObg3h2E2xnASJY3hwmpqLcqwAu1jxGBhaO5aHDTNYBc0T8ODsHpKy9j7
	5CodBQMRJsbiUnzVP1se4l1a6L3EOWnQMcGUlSewkVIgXueEBr7KoxFJ+PEKmY+w
	gwsMnBnkj7alt715k0hFUCCz66/u1vTsWUJ+4SUVPic/4kdDNTKDdifhpgirs3/Y
	K+IJv1qD4mIzSmePStqdSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730300173; x=
	1730386573; bh=tmIwzhdVEu36U+11NzuePr0At4eBbi9WRuSznp86bBs=; b=U
	JSmaFiJgBHBGw8WYIY7GAZemaHoGLZXrcJ7ztK8sQ/HuHJiFVtrzK2AT2BB0EuGB
	NPAlIZtLrrG11ZE77Y488/xRMGlD7EhWsMPj3IAps7D6w8vNgdjxMvxxJVeux2qJ
	aBWGScVp5go80bNnuT/uV8iOMEunOfmf0X87NpBKQW0jqkhXca7zd74Tv8o6Gzod
	M+LkacOVY0YPHroyPMJJTqHY8rjQfJyqrWIJbzCEw79rd8fMXEDS5uLUvS5DFCcZ
	ogdqIh9UsNG+z1Px2OHM+Beq16ys1LNvPm/1tsaxoOi4pvMeZZMW8BUlm5qB3+DA
	3VLQFyGwFbupvXHLgKH/w==
X-ME-Sender: <xms:DEkiZ4pqo6bniN6Xo2klkSFKb6cqS-8ZFp41ZM7u6EMZv6AtgzwEew>
    <xme:DEkiZ-p0evAnqVQ2dSSHYpc46rxEUUZt-e4sMjY4yh4Xir7L4sk9HNK2-km1xjfXH
    hADcHXSyD16YX80xdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekfedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpeehtedugfelgeeltdevvedtleffhfetgfdtjefhkefg
    udejfeeuueefvdejuddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrihhordhlihhmohhntghivg
    hllhhosegrmhgurdgtohhmpdhrtghpthhtoheptghorhgvnhhtihhnrdgthhgrrhihsehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepshhuphgvrhhmudeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphho
    rdhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhug
    gvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhu
    thesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdq
    ughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:DEkiZ9NbRhTjW0LDt3YF7_Mv2F89UCO11y33jiD-DwFbNwcNBPqGIg>
    <xmx:DEkiZ_4W3L3yB6eyZFqXGnENv9vAeNIxJs6Kpt6l_q22lp_Sssox4Q>
    <xmx:DEkiZ37CyUU5bZCeAdm4aEQ-URqI8uOGzZFB7Rs4hdaU1-3kDcox8w>
    <xmx:DEkiZ_ifswyJWJyZ0hDygowWE0PF2ZbLPTGdklacWg5zl954KA5OBg>
    <xmx:DUkiZ6YNc7CVZu9BBLnMLQdDrHDYy6FXW5rvi4tAjwGZtR4EJkjnUluT>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C14243360079; Wed, 30 Oct 2024 10:56:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Oct 2024 15:55:52 +0100
From: "Luke Jones" <luke@ljones.dev>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org,
 "Jiri Kosina" <jikos@kernel.org>, platform-driver-x86@vger.kernel.org,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com,
 "Mario Limonciello" <superm1@kernel.org>,
 "Mario Limonciello" <mario.limonciello@amd.com>
Message-Id: <fa72f965-b265-425c-aa88-c15d311121a0@app.fastmail.com>
In-Reply-To: <cb374d84-c29b-de0d-21d8-c711ccf3ea80@linux.intel.com>
References: <20240930000046.51388-1-luke@ljones.dev>
 <20240930000046.51388-9-luke@ljones.dev>
 <33f4f13f-c5ed-ac89-9243-4356976cc042@linux.intel.com>
 <46cd22c7-e63a-4dde-aa97-f76ac9bb6b8e@app.fastmail.com>
 <cb374d84-c29b-de0d-21d8-c711ccf3ea80@linux.intel.com>
Subject: Re: [PATCH v6 8/9] platform/x86: asus-armoury: add core count control
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Wed, 30 Oct 2024, at 3:14 PM, Ilpo J=C3=A4rvinen wrote:
> On Wed, 30 Oct 2024, Luke Jones wrote:
>
>> Hello,
>>=20
>> On Thu, 17 Oct 2024, at 4:41 PM, Ilpo J=C3=A4rvinen wrote:
>> > On Mon, 30 Sep 2024, Luke D. Jones wrote:
>> >
>> >> Implement Intel core enablement under the asus-armoury module usin=
g the
>> >> fw_attributes class.
>> >>=20
>> >> This allows users to enable or disable preformance or efficiency c=
ores
>> >> depending on their requirements. After change a reboot is required.
>> >>=20
>> >> Signed-off-by: Luke D. Jones <luke@ljones.dev>
>> >> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> >> ---
>> >>  drivers/platform/x86/asus-armoury.c        | 227 ++++++++++++++++=
+++++
>> >>  drivers/platform/x86/asus-armoury.h        |  28 +++
>> >>  include/linux/platform_data/x86/asus-wmi.h |   4 +
>> >>  3 files changed, 259 insertions(+)
>> >>=20
>> >> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platfor=
m/x86/asus-armoury.c
>> >> index 09e0cbf24f25..caaa55219946 100644
>> >> --- a/drivers/platform/x86/asus-armoury.c
>> >> +++ b/drivers/platform/x86/asus-armoury.c
>> >> @@ -40,6 +40,24 @@
>> >>  #define ASUS_MINI_LED_2024_STRONG 0x01
>> >>  #define ASUS_MINI_LED_2024_OFF 0x02
>> >> =20
>> >> +#define ASUS_POWER_CORE_MASK GENMASK(15, 8)
>> >> +#define ASUS_PERF_CORE_MASK GENMASK(7, 0)
>> >
>> > Align GENMASK()s.
>>=20
>> That is how clang-format put them using the .clang-format in the repo=
.=20
>> I'm not keen on maintaining style manually as it inevitably develops=20
>> inconsistency.=20
>
> Hi Luke,
>
> Then you simply create your own clang-format and put=20
> AlignConsecutiveMacros into it.
>
> I'm not buying using a kernel-wide .clang-format as an argument becaus=
e=20
> there are per subsystem variations in various coding style aspects a=20
> single file is never going to capture. It also has ColumnLimit: 80 whi=
ch
> is explicitly stated by Linus to not be a rigid rule so that alone pro=
ves=20
> your argument is on very shallow grounds.
>
> The commit that introduced the file states: "Like most tools, it is no=
t=20
> perfect nor covers every single case, but it is good enough to be=20
> helpful." It's a big set from "being helpful" to "I want to strictly=20
> follow what it outputs". I believe that file is there to help you out =
if=20
> you want to get started with the style but it does not guaranteed its=20
> output is accepted as is, you will have to tweak its configuration to =
get=20
> the desired output here and there if you want to use on daily basis.

Understood. I'll adjust things to suit.

> --=20
>  i.

