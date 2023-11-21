Return-Path: <linux-input+bounces-178-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B587F2FD0
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 14:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2CF11C21055
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 13:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAACE3D3B8;
	Tue, 21 Nov 2023 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81E7D6E;
	Tue, 21 Nov 2023 05:53:20 -0800 (PST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r5RBn-0003mX-Br; Tue, 21 Nov 2023 14:53:19 +0100
Message-ID: <0e10112a-7560-4dd8-8a03-5fdfc838168f@leemhuis.info>
Date: Tue, 21 Nov 2023 14:53:17 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Logitech G915 Wireless Keyboard acts weird on 6.6.0
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Input Devices <linux-input@vger.kernel.org>
Cc: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>,
 =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
 Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jkosina@suse.cz>,
 LinuxCat <masch77.linuxcat@gmail.com>, Marcelo <mmbossoni@gmail.com>,
 Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <6929ebbf-f2e0-4cd4-addc-1e33ecf3277f@gmail.com>
 <ZVyr-of1X4RudpWG@archie.me>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZVyr-of1X4RudpWG@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1700574801;d07b6676;
X-HE-SMSGID: 1r5RBn-0003mX-Br

On 21.11.23 14:09, Bagas Sanjaya wrote:
> On Thu, Nov 02, 2023 at 09:11:42PM +0700, Bagas Sanjaya wrote:
>> I notice a regression report on Bugzilla [1]. Quoting from it:
>> 
>>> Hello, After upgrading from 6.5.9 to 6.6.0, my keyboard started
>>> acting really weird in its wireless mode, key actions sent are
>>> completely wrong, see video attached.
>>> 
>>> Most keys are perceived as either E, 3 or F7, with F8 and <, as
>>> well.
> [...]
>>> 9d1bd9346241cd6963b58da7ffb7ed303285f684 is the first bad commit 
>>> commit 9d1bd9346241cd6963b58da7ffb7ed303285f684 Author: Mavroudis
>>> Chatzilazaridis <mavchatz@protonmail.com> Date: Sun Jul 16
>>> 18:23:44 2023 +0000
>>> 
>>> HID: logitech-dj: Add support for a new lightspeed receiver
>>> iteration
> [...]
>> 
>> https://bugzilla.kernel.org/show_bug.cgi?id=218094 
> 
> There's no reply from culprit author nor linux-input people (did they
> miss this regression?).

I guess part of the problem is that Bastien got reassigned and might not
care about the kernel anymore.

Another part of it is that Jiri was CCed, but Benjamin was not.

Ideally of course Mavroudis Chatzilazaridis, the culprit's author would
look into this, but from a quick search on lore it looks like Mavroudis
is not a regular kernel contributor and thus might not even know how we
expect situations like this to be handled.

> And on Bugzilla, other reporters replied that
> reverting the culprit fixed the regression.

From Takashi's comments like
https://bugzilla.kernel.org/show_bug.cgi?id=218094#c33 it sounds like
this can be fixed by resolving another regression as discussed earlier
today here:
https://lore.kernel.org/all/87edgjo2kr.wl-tiwai@suse.de/

I think that might be the better solution, but Takashi, Hans, or the
input people will know best.

> FYI, there's similar Bugzilla report on [1].
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=218172

Not sure, that might be a different problem, guess Hans is the best to
judge.

> Also Cc'ed Linus.

Linus can speak for himself, but I guess he gets enough mail already.
I'd say in a situation like this it thus might best to not CC him;
instead poke me when things apparently are not handled well, then we
together can decide if it's worth bringing Linus in.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

