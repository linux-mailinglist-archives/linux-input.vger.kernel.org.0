Return-Path: <linux-input+bounces-5131-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DEB93A4B9
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2024 19:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 824C6284E01
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2024 17:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CAE14C5A1;
	Tue, 23 Jul 2024 17:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/OO6NnQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB43214A4C9
	for <linux-input@vger.kernel.org>; Tue, 23 Jul 2024 17:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721754657; cv=none; b=JyMR9YsoYL0M58IETA7T6+ydnasWjkGEM9AjRqFcnvswS1qKicBGSkRfsf45TtZJ0I71KzFr07l+Q57PC/wKEEMEQWxJT+x6plswwLYFIQvltMGn/NOPguy2JX/KIWw8qwgkyykvsIJonY/cCWwgOj04HI2y/ER/enFTDS1xFBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721754657; c=relaxed/simple;
	bh=TiiXapBe3plWDtxfzMezopKA2+G5znkdMQQv1Tcz7Ss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nBnZ2xVME2xx7CjJxejmgMth0xfJ9joAiqOtfDXgO+qL8uh4upDrD3pcCMFPqVga0N50LCShNgDAlY6TdElZ4tW65hrhIHTu1Kn6JBhlrwy569/zoyAfvAkdmOKP8NzkFl0jGoZ3qTCXDVSAZiW+v3A5WaRGKqlq46oHguKsgpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/OO6NnQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691B1C4AF0A;
	Tue, 23 Jul 2024 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721754657;
	bh=TiiXapBe3plWDtxfzMezopKA2+G5znkdMQQv1Tcz7Ss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f/OO6NnQiCRvySHXAxXTryFKcRCMNHrPdcqA0FawCcZQ6cJneghbBjUTqi7aicyRm
	 dFNaEYqoaF+CJNE1HztIpa398kXbrAYIFolwd7Annl2oBvNtAmT1y+pELWa9mnMIHu
	 QWlAor4xvl1rhahKrPsrMovZBlUTw8ZbIlKcouzPvQGqAL/itc87AbsjUNz2Kok4vK
	 7ZNjnjTLtk2rS44nZKxz+gFJwWhIqm3M+mxV7NTRJ7sONg3x8bQA3xASCt+QZDru7a
	 R+X4aDzAQjhOc8H1WotKx1L6ngA/lWY4NlKDeteRwZQuWGDRtXYzLVfD8FEMVLy01H
	 G3PyxjqWHVTPg==
From: Benjamin Tissoires <bentiss@kernel.org>
To: jikos@kernel.org, linux-input@vger.kernel.org, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: petrvelicka@tuta.io
In-Reply-To: <20240718111616.3012155-1-Basavaraj.Natikar@amd.com>
References: <20240718111616.3012155-1-Basavaraj.Natikar@amd.com>
Subject: Re: [PATCH] HID: amd_sfh: Move sensor discovery before HID device
 initialization
Message-Id: <172175465613.391329.15479817028414601464.b4-ty@kernel.org>
Date: Tue, 23 Jul 2024 19:10:56 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0

On Thu, 18 Jul 2024 16:46:16 +0530, Basavaraj Natikar wrote:
> Sensors discovery is independent of HID device initialization. If sensor
> discovery fails after HID initialization, then the HID device needs to be
> deinitialized. Therefore, sensors discovery should be moved before HID
> device initialization.
> 
> 

Applied to hid/hid.git (for-6.11/upstream-fixes), thanks!

[1/1] HID: amd_sfh: Move sensor discovery before HID device initialization
      https://git.kernel.org/hid/hid/c/8031b001da70

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


