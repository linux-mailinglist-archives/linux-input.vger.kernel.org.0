Return-Path: <linux-input+bounces-5870-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C3E95EC9A
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 11:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79AFB1C213C0
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 09:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5947784D25;
	Mon, 26 Aug 2024 09:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="pXL8eYFR"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D749913AD22;
	Mon, 26 Aug 2024 09:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724662846; cv=none; b=SS2McssDUVA6izXaPETtPs7FjSZgptqjhCXMZhxxd2TAJ5QEmXl2nfkF7qYPXcJpB/VWjjLj6uB9DliF17/nZTEzJxsRUj3sDBOeALhTwugPK1nmZmx2pN8w780aCxbHgz4q7ogXwFolt72mY8AmXxwZFFyTkeQFsCj+FneTagI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724662846; c=relaxed/simple;
	bh=fw3mwugogCB7KnXEdkXpUIMDWmO4PBh+J4IMIJItIZI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Ff6cmtyJwAOggG+7X8zp8mjR0XXRiqkf2KwBMSLdUOS5i9gBzvd0tBMdXDMsDUq5pSjrZid1bJBryPykQC4rxF3tfmiCb6cRn6qCIWihCO+XewJXs+FBMpcERWncD2nfqB770zc66HrsWpneaT/yZ9aRzf2M4krKIRhxjcpomFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=pXL8eYFR; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724662830; x=1725267630; i=markus.elfring@web.de;
	bh=fw3mwugogCB7KnXEdkXpUIMDWmO4PBh+J4IMIJItIZI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pXL8eYFRNcxdMdZT0savz718Vnmqg4hulxFAw5Dp+L/NA3f792ar2uW1iWUJPhmR
	 f5yHDkQ8nbHeelR04ifjGuT9mLOGp0WX6B4YYR+PFg2AId/QZgWn+ezRoD5JPpOoc
	 al4+4dWdCbM5GzGYAhJb1LYBm6PKiLvcHPduoAXPo79EALfETPVSS9H3FLHUcNf06
	 jRG3hh8jwtbZ90yRsXVWaALrY1CZCn3T4ugcQBDws4pBZmG3DG06S3XdfUMLAkFU6
	 i2MzlH/Kbg2Vdu19qJ5QqtOC/6ILXwTOSmzpeVbcAwFmhJJwTXT5895hOsGFiLWfL
	 HrBMRH4uYbBtadizlg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N3Gkg-1s1AQW1znO-00zsLs; Mon, 26
 Aug 2024 11:00:30 +0200
Message-ID: <05a1b1bf-4de7-4e1e-8ec9-8c61e129e5b5@web.de>
Date: Mon, 26 Aug 2024 11:00:30 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <ZsrAa9XcDvHeIs9T@google.com>
Subject: Re: [PATCH] Input: psmouse-smbus - use guard notation when acquiring
 mutex
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ZsrAa9XcDvHeIs9T@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3Z2aoRuaPlsTgz07INOT3VvchL+LwZAFNzoMIAFiuj3zPvmM5Xm
 oIKD2tLweh1nm1c6LYjBv4U2z2qgG38WMRhDcXCdzCNQkMDLXKrd4DFoFM2H5ae8twIIe1q
 zcejtzekH6CKnaaRyjU57CqkR3eWRcLwCvGeK0t/wWGd0tX4VHQKWl4b6ul1sS24MW7Hp5/
 wTuYbpztUGfaW9kc8sfBA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bxSVx8RpDCc=;qIlbB4Qx+F5roM7zGOVTn91fST/
 xbfvou3+OPHo7UkdkcIzf5rREXfPGBWsfn7baCEdM9EZXoIk7Ziryz1qn1KJQCfcZZ6KyCsPe
 1n2G6ZBfN3NeENhqtj/N6GuArE3d26tKfS1ilpqTJDaxXZzLwZlFwtwGEGiAaGE9cJwQF3kys
 5BtyOQD7QnUdQ6+n+dUT93rz78FpO52llALuu3sM16zqWiowBWNLQJca7vwZVWG+/TCAU/isR
 sYweaP1HphG4jUWCEtyaTlz3kXCG8wccaPdMNy14whwU4meNsx79QAy35uhVtEruKbJKHbokJ
 BorZOjV9clBufA59dPvHfOkpRh7KvTnAD9mK08cst3quyNyOaHYXD10Bqzy2FbGtBkQcvT9zk
 1q2v5ch2NaTqD3EMrPiUFVO9tPf2rDpSPZz2QdHf5WOfqSUO5hmqSBvpZeM+X+lYUI6RP58PP
 5A1jOqhNlfYmBHEZpiO892Hr4uNKsc3WaXhuWjIi3UKeM4Tm6LyF0PpBCX293pO4VC8it1V7m
 J8sUYgFkSIkDIaD+khlgFKOiwo0WaTB+WvlCEs6ELA9NmqLSKvuKbxpS0e9FN1pTz2swnZ3zB
 NXXDuZ2a4rNN9D16zbMCDLJBWd1OJzl1XURa6CqVdKGfDJgDnl+9ASIqbvmiQRlhNFPIVyUeY
 RDzNkCPecgjofwfbFXdVnootBSuIBrhKDobrDbiVgpT7mQ21NsIBd1UlCqaiJl7TIwUCOlLst
 RQXYVvOh3mtwazLF7pYvdM64JlydnZ3NbwhAoDaxGxkT/biFs3rhnER7zQ1n94M5dGm9o1Dm1
 5VSleBjXqQdMBrqvP5yoAqjg==

> This makes the code =E2=80=A6

How do you think about to improve such a change description with imperativ=
e wordings?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.11-rc5#n94

Regards,
Markus

