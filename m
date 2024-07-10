Return-Path: <linux-input+bounces-4941-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C56992CBB2
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 09:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08223281943
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 07:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7C381AC1;
	Wed, 10 Jul 2024 07:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLPjHBkS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821998172D;
	Wed, 10 Jul 2024 07:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720595543; cv=none; b=iFMkkb3JQdhvr6R1dsxJMSIsMbFi7l4DfRSWwcMf1yxvf1A/8gZ4Z/eyR9WZqmCMj/wBAfbCPOY5lnk5b6H9OgWg2DBLIyuZw4O1pGwqElisMM6dMeDsHj2II1xFqHDmbohh/8WgfsHZcwA8cNgeEhWXIEuIpw5RPqkeqCtIuQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720595543; c=relaxed/simple;
	bh=gT3nhY/t4rUgrGdRayqH0ayVTglibay/0TbG8xFalw0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P/RGIS9SVKSCUu7EjW2jp1H7gPUo4QkNrNOLRMONmBaMCQrBojbLPU6u17btlHvOphTyf+Ux9F8zaSPk9pqLLE7VN1SyXMCX5IZU+XSMtskQaAuqwYNiO1WuIjmZLAmEsBrQ2UUxgfChM8AabJyl2+Y8KwrnQ9sIMQvCyaugqIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLPjHBkS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FB9C32781;
	Wed, 10 Jul 2024 07:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720595543;
	bh=gT3nhY/t4rUgrGdRayqH0ayVTglibay/0TbG8xFalw0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qLPjHBkSBSx7yRyKN54nHc4ten3W1wFOHUY+Xus7Hk2vlnLeywR5ZYmWNeYiXPBHc
	 KLjD7QdIEP31rlVd34cdAU1qFCbRfDDYwBeTwCiJYfejz4DQfvfiSlyhstgX8ynFvb
	 Wzyhxs0gHeYbT+lyS/jPcxZ1O6GWi5bFMNuOeWwM3TCul94vMlZiIdOan+PZ26Ehog
	 AYdXVeLRQgjNFK8jJz4P6sS/dfKLs4TO0LhBghUlK3nW0Bt4I4ztXwk/mIa4Jos2kM
	 YY/alDT674nWxp4TxQoMaHOZVvcfnHbODNNT7Juw76CazbCGMZ871KFfZoI2L8Iz3g
	 j1gOTk+OssKTA==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240709-md-drivers-hid-v2-1-67faf2f2ec90@quicinc.com>
References: <20240709-md-drivers-hid-v2-1-67faf2f2ec90@quicinc.com>
Subject: Re: [PATCH v2] HID: add more missing MODULE_DESCRIPTION() macros
Message-Id: <172059554193.688107.7191888266798242377.b4-ty@kernel.org>
Date: Wed, 10 Jul 2024 09:12:21 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0

On Tue, 09 Jul 2024 14:39:11 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-mouse.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ite.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensington.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-winwing.o
> 
> [...]

Applied to hid/hid.git (for-6.11/module-description), thanks!

[1/1] HID: add more missing MODULE_DESCRIPTION() macros
      https://git.kernel.org/hid/hid/c/5bd8d7071e54

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


