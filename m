Return-Path: <linux-input+bounces-6283-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0628A96ED28
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 10:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3175F1C2367D
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 08:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0593143890;
	Fri,  6 Sep 2024 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYje2ho/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90111A28C;
	Fri,  6 Sep 2024 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725610067; cv=none; b=P7XFOveF3eyuuV+PtY8fHUxJG6Lz2Q0la0w5IRCvj8lgV+RaSCKTxl/UacopTfaDJuXu/MZOMtxNI2jRProjUR+bpA5brGgVa7dNTQIT07y20dUL+MB6EtM8GpNFd7BsPUqBbiN8q0x8J5efLUHHsCn2FckHpuA1vcKzmX4aZ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725610067; c=relaxed/simple;
	bh=SYQMAMrGfZDtL4+SJo/Q85WuP4a6Hrs1C1HLJcg3IjA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OGl4szmrIjULYYWuw+XHEj62oSbonhCuqvNusrxt9RVak98qIns0G/XGs2NN49vhu8GEaiy+lEnEzeDMv8uA50VUyZuWah1dqUiPyg0C3pEB8qgvjDx+UuO4VclGdu5p7MOHMsPvnq+B42X1DNqwVuhPj3vtfcMWR4wI3jhz8I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYje2ho/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46159C4CEC4;
	Fri,  6 Sep 2024 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725610067;
	bh=SYQMAMrGfZDtL4+SJo/Q85WuP4a6Hrs1C1HLJcg3IjA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kYje2ho/MlQZ2kOPakCBil7kabh/OgMGNSmv+ztIlnrIxvrIuFcpCy2qlMZY1XWov
	 Yse7SN1Yt62G83uKU3Rj+MOV3QrAeW8QjYDsVXzIzEjyMAbGYxjd8Nyv4Bdi0Fy5IH
	 B24FVp8A+Qir+Lz6gZ7uXhnYjk820zxzLWz1xYRZFU3bl+0pcnmCfaJqL+kwntTmD3
	 mL4TBTXrUxXpC28/uk48FYcYQ2d84hCZjbK0RU9B/lTGWYfUHmudyEPPR53Zk5kZGT
	 YkSLHFeFCC2trvVrr8JsGLuprRuKeOAUJfTbjFZzgJ6CNW91OxKlQEuFY2TAhHG+K6
	 wDts6zOMOkRbg==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240905-hid-const-fixup-2-v2-1-70915e0cc1c7@weissschuh.net>
References: <20240905-hid-const-fixup-2-v2-1-70915e0cc1c7@weissschuh.net>
Subject: Re: [PATCH v2] HID: lg: constify fixed up report descriptor
Message-Id: <172561006601.11208.1868683001716431339.b4-ty@kernel.org>
Date: Fri, 06 Sep 2024 10:07:46 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.1

On Thu, 05 Sep 2024 17:48:38 +0200, Thomas Weißschuh wrote:
> Now that the HID core can handle const report descriptors,
> constify them where possible.
> 
> 

Applied to hid/hid.git (for-6.12/constify-rdesc), thanks!

[1/1] HID: lg: constify fixed up report descriptor
      https://git.kernel.org/hid/hid/c/9f5305ed8010

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


