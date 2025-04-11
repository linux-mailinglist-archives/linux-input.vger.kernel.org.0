Return-Path: <linux-input+bounces-11740-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6B4A864FB
	for <lists+linux-input@lfdr.de>; Fri, 11 Apr 2025 19:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DADD19E7A14
	for <lists+linux-input@lfdr.de>; Fri, 11 Apr 2025 17:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBA423A9A7;
	Fri, 11 Apr 2025 17:43:42 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E7C23A99D
	for <linux-input@vger.kernel.org>; Fri, 11 Apr 2025 17:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744393422; cv=none; b=bKCyPN3hjOPfjegMbXl1TspyeDYCsfOGtZIwPQeMiQmQq8kEDch0EQyAG/nFr73hK/IjuRsFur+Hp0GIHO85NBAK079PdK4wfnK/7rOhyzFbNvJ78p5ZKqtSsXJ4rHEZmQBfnZH6AE6VOgBSmHQHtAggdOuAVd8mTfdtbi+sG8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744393422; c=relaxed/simple;
	bh=omOs0FggSTPr19o4R8nyIDmG0k/atNDpo15CTv2oJDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQDD9xrX/OAqiLvvIS1BIQJvqjFrID0ppIrWexg2xujCETO6pQsWg9bNWhzFpTYmbmRWQW7ujIgg/5Flg2QkTud6v8iRrOW4XC0NZan3Ru08PiwZRlJvsIq5wnw6bww/YyIqUwVIqv/yn7dy1tegCxm8UYf+2MbVMd9/5sq9xwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notsyncing.net; spf=pass smtp.mailfrom=notsyncing.net; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notsyncing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=notsyncing.net
Received: from [192.168.190.23] ([88.130.217.2]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MV2Sk-1teVxD3Fws-00Z750; Fri, 11 Apr 2025 19:38:13 +0200
Message-ID: <1b73dde9-7c26-4b80-a355-64782355b97b@notsyncing.net>
Date: Fri, 11 Apr 2025 19:38:12 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: fsia6b: Increase size of phys to hold full name
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250329172237.61874-1-markus@notsyncing.net>
Content-Language: en-US
From: Markus Koch <markus@notsyncing.net>
Autocrypt: addr=markus@notsyncing.net; keydata=
 xjMEZkr5fBYJKwYBBAHaRw8BAQdA2811uCI4LSoFBnm7giRzIEYH98oaACrR0XVtrAu+l4bN
 I01hcmt1cyBLb2NoIDxtYXJrdXNAbm90c3luY2luZy5uZXQ+wpkEExYKAEEWIQRyGYZtJYIl
 tNxnIQBkSAaoKlp/RwUCZkr5fAIbAwUJLv4HgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRBkSAaoKlp/Ry6SAQDfjxeNXoyl8974QSfPXPG0CQqDbzM85azMBm9iiiP0pAEA4tIc
 Us08rnA6Rhhwk2LRTbWJjv21pV7aIU6ZIhrBbQvOOARmSvl8EgorBgEEAZdVAQUBAQdAPvCN
 zQBVy0o8ptJ0/JhBDSVasY/H/pJ0xhOEkvUqoDIDAQgHwn4EGBYKACYWIQRyGYZtJYIltNxn
 IQBkSAaoKlp/RwUCZkr5fAIbDAUJLv4HgAAKCRBkSAaoKlp/R0OgAP94uXzkd1S7eJE5viap
 HxUfS8zqDcczRQJUryEVSbjF0QD/YR29GdNzefyjlqkOlCAVgukz7lhe/FtIW/fdDI/6/wU=
In-Reply-To: <20250329172237.61874-1-markus@notsyncing.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:PfW/wcXMyLKk7UjxFL5hT2PHSDCxGjPaQlyhilMLSWJokvgMo6p
 rLPSgLxgmw/VHA4EmGP00vFC9G6ESwzoswH5F/V/ag/vA5Meza5Te/kw5mwNg25CTjvUOQ7
 CKrDszhyIyTgmz6q2mx6Xp64ctljLcdEY1cWVGIusNZ7IeH3cfOoHd/t78baV0tU2Mo2stM
 ErbGshntHr1GRPz4KGeUg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wZI61RKvMcM=;JIxhvo0F0UiI8Lt4ChguI/8Xk8K
 moeQH3owCcVCiLFonbU6OaPapN4Ce3LI/M7CbCJXR0xTXTvxU9ZaIkomn1Hk4zylLIKxnpcwY
 JKecMEfdvpIDO/u+JaPIjwDZBxYpHM0FUZVTA2mIBSrii+PDwSu0s0EmKyPhGwJgWA6H0QDUG
 7bH7PSxV9kIlHE0dOryj694NTJFdL5PE/fHCCK+DWmpGIjaRb8E8bAtdixLR1LTdKbqpb4A5c
 PGI5NehW55yDPMQyyzWwP0jpvACiqwww57Phj0kO66Gs+CAor9jbDK7zUIO5TjBfwNL1jNfeJ
 6xveYrJwD9cqbANJMEk+u9+V2Ydy2pAL+T3rO61VKT+rPb3F9os7bVaOUB9i/qpatOGBAlwSH
 0slub1I+O+EfVJBEJDc8LDEGhKYw9C48tHlTnTB2W464AkTsrqmlzFWCUnv8xLZZnQlsvUr3J
 Z39qU/KssNiqH9wE6WVZH9migWWQSp4ceMnHCImgDZ7YWRDkDgdZm4tq5NnZJzDdO+nCcobk5
 /EvcgJ94KzNhKGmTqo7wxEDBL4d22fhvt+qNcOKzFaH+ik6RIqRYD2kgSFnezn8Ti7Tqbj6Gy
 qu3+6eeGT0HWQOOsQZdemwMvaBVDAQjQUs47y282TTROC8aQ/4Z6SRZ3yoK/SUo4U9tyIChYi
 fk3kerJTzzD/3xGt0nA0pDywqkOgBvQ5o0BS8Dis4TjHF2vMvnCYpJjURhOOQZf1D2beff9lv
 KQU4HsITra1inSCgNnh2h3nSFWPkAPKxzXvzlZTyOgMzdusupYIn4WPdOnRqKBAxcC7Qm3iNd
 xBBp+PAaoGEjNbFphxd1c2pJOfQ0EI/UE1ih4b83OknjlrbN/3Xt3TKMUmnxkXBWzrFq4piCQ
 4cKIMjDDPcTqcap8H9+zDTFUxqxBC+wDumNA34Hw4P4vSKv/fGKtWOZhzhW3NLBF79UsVBqrg
 bC7XRj+0rhrFQTGRmM8KLFZOujxYKDRw0hnLcS0K2Yzf76bmopisspcWKA0DvRHkLw3lbbJg2
 ob4OZkq/Vmwm1lk6LQIHQhgIb9JtIneWWkh6jRrXvlrv7sBupONQdwx+Cwj6ZGj71bxuMPM/m
 lGSO8XQ6G4BoLk60VMMaSWIQPxgEgz2YRatZqep0EDd/0q1inQ++2NGAYswBIRyg8qQIJ4IaK
 Qe9iiIruod576pJR6DprM0CfvIQjA65AEO4+Atxs3zMqkU+BlhU0TOLZlU8zoNJoubYSf0lT3
 RzlVnF0rakTwBUqSKG3gQl/dHG/Vy32VvGJW4o11RiTjSyb8Pbzj1+uvTA95Xnc/ZIOgezR2t
 mPJ44brnYE/8z7Gndte/IUdiqBBdhGmAWH3NYohSGge9Ka/dm4qvtfUxfyTPYNMfp4DduhCsY
 RMI1TfwWVX/dAX5gC4+jNO2nFs92PUDSl9y48=

Hi,

I sent a patch 2 weeks ago [1] and haven't heard back yet. The same happened for another patch I submitted at the end of last year [2], where in the meantime the patch of someone else (doing exactly the same) got merged. Therefore I have to ask:

Am I doing something wrong? Is there a preferred way to submit patches for this subsystem that I'm missing (like Gitlab PRs or something)? I'm happy to change my workflow if it helps you.

Thank you,
Markus

[1]: https://patchwork.kernel.org/project/linux-input/patch/20250329172237.61874-1-markus@notsyncing.net/
[2]: https://patchwork.kernel.org/project/linux-input/patch/20241223153453.12924-3-markus@notsyncing.net/

