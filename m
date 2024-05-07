Return-Path: <linux-input+bounces-3549-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D788BE396
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 15:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89F1EB26BB0
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 13:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E4E15FA8C;
	Tue,  7 May 2024 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/RJjbci"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C032E15FA86;
	Tue,  7 May 2024 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087892; cv=none; b=AmOm71Gft532RY+cNBqaLhlRP1CJJF4B0ypOCPMpu3cV3ft9A6p9DSTdFfrfenqz/Sf4HaWSNYSH4VXURBsmtqQybNnwIQRtLSzyAxy3Y1WyUawAm6MDLfSbV6xJ1eFXBHu73g5XUuDw/NvTW/Mxh/Ct2aGrTqeuil/liHSkQ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087892; c=relaxed/simple;
	bh=pOjbk/XkgKsAUwUPfCRPvgInc4x4iCS6cP+Kj/ruFkU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZbVbnOfyLVT+wgj62rtNFR9P5j+weBX/nB1D6Kc05X4UQ4QZqrbkVNpB59c027PQMxly2qjy8VMk+CCG7goHD1nLiG2k2oOtw8k4E9lodWsXHZ2vr1U8PDfrOyGnsykm2cpM7K4ws3o2ElUCXqMHccywVjJkFwnPFpbM5dzPAMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/RJjbci; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD61C2BBFC;
	Tue,  7 May 2024 13:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715087892;
	bh=pOjbk/XkgKsAUwUPfCRPvgInc4x4iCS6cP+Kj/ruFkU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k/RJjbciM0guA2oWyMzFXgBe/YZUOxtI1tb5dELGIMF1/HgzGb6Jhx6r5T4z5e/mA
	 0LmOKNZzNjru8oqccrlUsCAiJ4T1J6ErYYJAWkNfIFtZWon08ZR5/VNd8qfDQA4CDw
	 exPBHYqE3COOQklLCefIgNjvCkO/E7B0LgaFp2NihY4ucnLbPpeFig/TcXBG8V7NTY
	 CTe5t+G74yH+hhMS0tcj9SqJjY2RGP/pWJpd9xHFfPxOn/gL9nlPGs54KFiPsaO6or
	 lA/vRhsjD8EfcTlLrQloM/Oep0+cwIPaZwP1UQ/giC5UUp3RzLHMcu2UrdfdCbxvJO
	 cuahBjLOMADJA==
Date: Tue, 7 May 2024 15:18:10 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Milan_Pl=B8=EDk?= <milan.plzik@gmail.com>
cc: David Yang <mmyangfl@gmail.com>, linux-input@vger.kernel.org, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: kye: Change Device Usage from Puck to Mouse
In-Reply-To: <CAN-R+gzMY6j=otYxDbCzYobn=FeM=4MLMrSr+scqUkHTb36qcA@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2405071517530.16865@cbobk.fhfr.pm>
References: <20240502042335.15611-1-mmyangfl@gmail.com> <nycvar.YFH.7.76.2405062329320.16865@cbobk.fhfr.pm> <CAN-R+gzMY6j=otYxDbCzYobn=FeM=4MLMrSr+scqUkHTb36qcA@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 7 May 2024, Milan Pl=C5=BE=C3=ADk wrote:

> no objections here. Unfortunately, I can't test the change at the moment=
=20
> (I barely remember there was a mouse that could be used with that=20
> tablet), but the change sounds good to me. Also, thanks a lot for=20
> keeping the HID drivers up-to-date even for such old hardware :)

Thanks for the prompt response. I've applied David's patch now.

--=20
Jiri Kosina
SUSE Labs


