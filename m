Return-Path: <linux-input+bounces-9837-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A97D3A2C33B
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2F72188CC42
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600AD1E1A23;
	Fri,  7 Feb 2025 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEYULvme"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3625B2417C9;
	Fri,  7 Feb 2025 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738933569; cv=none; b=mA6O0rZyOw86w1mntSq9+ti/z7ZABg4NYRLs/bkhSr7NQ86s9jnKFZs6oVMbxSAdoPrqSGpvPLEsGyhgksP2mZbdCpqAiiWIQ6xjaxljfx4DIGqg5a78ujor+Em0EsKegs7+UChgLKo53CIDD28+x5QpIoNbyK/PismWuU0uEEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738933569; c=relaxed/simple;
	bh=OSPutIB0BtC7gKjK1MOmSaQwPeYwzsiH5TMs0GXJ35c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=geVw1wmTTOun3b3C5riQvsoe1crgl8vaggFCkKIYn25AeUpDEHZGzAgNTXI1cHHe12UfcaOU47LjypzBbKgr1egmSPHgHCqkpFgaSV8qyzUeiOquNdABK5w7DqUuYPtMJ4b4HZJ1l4NO/WghycZYw/dOEzAinEbhej9tQgt/Vz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEYULvme; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F9AC4CED1;
	Fri,  7 Feb 2025 13:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738933568;
	bh=OSPutIB0BtC7gKjK1MOmSaQwPeYwzsiH5TMs0GXJ35c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jEYULvme0ilf76neyv/0DzAoOLBMpJVnLpLKkGH0u50H326ssVsfWO/OoWi6DZKar
	 criH9bTDCzuvPNcEjuNS7rqBMEEW4MPEQox7jX6cPNUQcDzHg8xoEzK/MY0rOh1o4L
	 I7J6JEuLKAEnLkwcdl3Sgrz1MNxtbdQtYGrPGUsRe8JQv6angFklWhvz4tbLiWudCV
	 9FVsZO8pVACorj9yrcBes7ixXOU7wwSqomLa5nlqdDog45FegH1GIXIxM54EevFQYN
	 9Hz5IdPlptjAOzWOnLCLeZrJdiNIeXUMlL+JaIvZoLbxGLtV6GHvGk+hXIy5X6vOQE
	 xk8ns5I7IS20Q==
Date: Fri, 7 Feb 2025 14:06:06 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Ievgen Vovk <YevgenVovk@ukr.net>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hid-apple: Apple Magic Keyboard a3203 USB-C
 support.
In-Reply-To: <20250112041314.11661-1-YevgenVovk@ukr.net>
Message-ID: <0o4nnq51-r499-p6s8-82s7-0n6q4q6sr30s@xreary.bet>
References: <20250112041314.11661-1-YevgenVovk@ukr.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 12 Jan 2025, Ievgen Vovk wrote:

> Add Apple Magic Keyboard 2024 model (with USB-C port) device ID (0320)
> to those recognized by the hid-apple driver. Keyboard is otherwise
> compatible with the existing implementation for its earlier 2021 model.
> 
> Signed-off-by: Ievgen Vovk <YevgenVovk@ukr.net>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


