Return-Path: <linux-input+bounces-12627-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB55AC702C
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 19:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 737F818908CF
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 17:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27C328DF4A;
	Wed, 28 May 2025 17:51:56 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD436288528
	for <linux-input@vger.kernel.org>; Wed, 28 May 2025 17:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748454716; cv=none; b=ORPsGOzd1XEvi/CSd9SGN750stPHa/OOE0Yqj7qqbWCo1sSAaBDZsg0HO9deKPj7SBdfGwO1ZoNdjvqd1ei9iOX1HHfyOLhoG/Vww87MV9taxXb530skLYp2GXzdMRpQTB7bBErHbvdP20iy4kY/vDtHy95QUgvOjB7R/Wdcsmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748454716; c=relaxed/simple;
	bh=VUEbqXjXdB4yM0vJ0Ov0lQGd40LnSaCWy8RjEigvckI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qyOyk/0r3B14nwDpAlKpWVFclUJN6MjqR3NBqXc/N3d9aKWChuoGr2HTqPdK4dXVJxQ/3kUFKGs6cbig5umD/nbzxMQvGRJoV+Vf8v0ZGsjdZtIyHLpZEp5IjQgp9af9vRf9eSihxSBgdrZc48bzyEl9MeQeBFJigzukSb4+S5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notsyncing.net; spf=pass smtp.mailfrom=notsyncing.net; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notsyncing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=notsyncing.net
Received: from [192.168.190.23] ([88.130.217.12]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N3bb1-1v1c7Y33f1-00sDnG; Wed, 28 May 2025 19:51:51 +0200
Message-ID: <53d93529-db45-41d7-a6d4-e01f3bf8e5ed@notsyncing.net>
Date: Wed, 28 May 2025 19:51:49 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: fsia6b: Increase size of phys to hold full name
From: Markus Koch <markus@notsyncing.net>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250329172237.61874-1-markus@notsyncing.net>
 <1b73dde9-7c26-4b80-a355-64782355b97b@notsyncing.net>
Content-Language: en-US
Autocrypt: addr=markus@notsyncing.net; keydata=
 xjMEZkr5fBYJKwYBBAHaRw8BAQdA2811uCI4LSoFBnm7giRzIEYH98oaACrR0XVtrAu+l4bN
 I01hcmt1cyBLb2NoIDxtYXJrdXNAbm90c3luY2luZy5uZXQ+wpkEExYKAEEWIQRyGYZtJYIl
 tNxnIQBkSAaoKlp/RwUCZkr5fAIbAwUJLv4HgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRBkSAaoKlp/Ry6SAQDfjxeNXoyl8974QSfPXPG0CQqDbzM85azMBm9iiiP0pAEA4tIc
 Us08rnA6Rhhwk2LRTbWJjv21pV7aIU6ZIhrBbQvOOARmSvl8EgorBgEEAZdVAQUBAQdAPvCN
 zQBVy0o8ptJ0/JhBDSVasY/H/pJ0xhOEkvUqoDIDAQgHwn4EGBYKACYWIQRyGYZtJYIltNxn
 IQBkSAaoKlp/RwUCZkr5fAIbDAUJLv4HgAAKCRBkSAaoKlp/R0OgAP94uXzkd1S7eJE5viap
 HxUfS8zqDcczRQJUryEVSbjF0QD/YR29GdNzefyjlqkOlCAVgukz7lhe/FtIW/fdDI/6/wU=
In-Reply-To: <1b73dde9-7c26-4b80-a355-64782355b97b@notsyncing.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:vYlm6/6fG+KRtZWUDGcD77qEUNBSET8Dl002+UzWcsf/xyWuQwO
 Im5r2tUxIHkhB8zpb/f3x0UFD/W2ks8eiT4yAWhYSK3WBx6lKpOIfxhKGyiPBoGdzk02Utb
 MQ4hZCy5fTz7vGJ1LCAl++Ms7ORdsz0oVwRyISW3Wruit1mNbljEZvViB3TTbJaqKBs8umU
 E7pBU15dAAWTtc1Bpm+Ug==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vrLZmDMiGM4=;f+034EfeCYJsLAfuwgctdi2kjwv
 adZfeN7QdVG11W4IVk5vU+rz/IpqbJ3euGESsvXeFZAbmol34KhURX67CWK4re+M8cIK/qEEN
 UTDaZqMMTJO78Fr1Ntu8ZxwXPMHGANBPd2+DTUvRlD/4lpYps8PFdNQj2mNNmTr7dB9sMGp4g
 k6SSLXqlsOkWdW+Fmcy6IzWAnP4JF0L+6VRyHVjZxBCCBhXhCrOZ41CHh1arMMtgV+aBcEJm8
 7H5i6hCA8GndB4Ap+T72yJequPajgt0APOBf/l9je//F9kCa87bLdXwQ9TYlKJ0F6tGZWlSEV
 vK84/98EKyXt+W8ttgYXg0fEgLk6tfLTcaZDQu9sVXxhIbdyaaTi1vF4YEhCHdFvf23+1sJys
 eHo7S/O6xCjnnWbA52WAsqsRR3eBvJfSvChC7TYulWYTux69Jy57gZ8Le8vxzb2xHH8alMAt8
 OyU/RMvU+3+vjLa9bpfskv5dKerxMyWY9u+/0dZNMVo/X7AMcA2C82sQLNt9U18Evy6HGMuoo
 6hH09LTTxJ1sk0DxLfg39rx8paOUU+pz95XHtamVtYzf0V0fDsKwv7SzujJEVroyu9XeIaNqG
 RCuLxoPPT6/lccOyzVo9ae89WaaHTUg9MNMsShOiqV+OGMmSab6cf6pbtmQLYDAxNhPOA8WF1
 8PT2I7KvOKc58xRXUh/jAgsExNBFUiEllStNyc+zBkvPhO/j/zPE35OSokK46ilFhWVtWF4vC
 bDa1iETem2AxVJEs/TVHMZoyyZ0VvUpEltUcCc9hPQ6zEqOVckRtK/KINX4gYr3pIS4Hr+0lL
 H+1rfSZVe9RyaqRTnimR3lpweIRgeOPx9TwT3k5AjW+97dS1wRozOjxwh4dCl5RR4LimRQLvX
 lQfHCAHWJDWgAbSjOlGsIAKKdbJQBtarwqr/tVGf/sffKP4ZlYSMayhLmVFclGvrfl1QfErIz
 oBHSG3Z0fUF7KAaIQl2MGSqjFDrPDvT+SsXEpEieT8nxwpeixm3dl+UX8uRZlzdRc8ZmnE3r5
 Pg9gAm9+kJcDlBvsEIfHah1oWrpEn5Jo73F+wtHPp7oJCp5XX5rArrhyh92jnBuP+WM3BVfcQ
 MfgfJHIEnlhZ427S0WWYuBU7TAidwNWDmAphrvAjIiD6idA9B5nFuYeXiNnaH4FRXByR5pJwW
 tXVbaSR3GBZ0MbvHUnB8Av7xw3W0P27h7Ym1GDXAioyMJg8YRqmX6XhjIcXzFpWC6CJiFDz3G
 pS3+3/M41SWNwZ3O6tlhaQursBlE0SxcnXM3xCpFqsy1axe9efqZYgKCMtmqA5jIfjnv2UgmJ
 JqRXiRu9xmY6S7ZGCdlAEzOakZ+HZFr2BZsS/OgtUbOG35+eD/y9pbambpgzL5yCx7kfptDZ6
 /EHSCA3AwuHji4KXIIP0Q7n9PQgM/RUqI9Z8tRiUEJq2wdGnPIfsNCz0FR1w+BfGivQi3uaU0
 Jk7tr/A==

Hi,

just following up again since I haven't heard back at all about my patch from late March [1].

It's OK if you'd like this issue solved in a completely different way, or not at all (I saw some controversy about this topic on the mailing list), just let me know so that I can act accordingly. Or, if more time is needed, a quick "we're still investigating how to handle these cases" is also appreciated.

Thanks!
Markus

[1]: https://patchwork.kernel.org/project/linux-input/patch/20250329172237.61874-1-markus@notsyncing.net/

