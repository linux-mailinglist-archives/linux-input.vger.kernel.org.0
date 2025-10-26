Return-Path: <linux-input+bounces-15729-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E04C0B187
	for <lists+linux-input@lfdr.de>; Sun, 26 Oct 2025 20:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDECB189951C
	for <lists+linux-input@lfdr.de>; Sun, 26 Oct 2025 19:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249322F656B;
	Sun, 26 Oct 2025 19:59:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (beyond-windows.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF5E2417C6;
	Sun, 26 Oct 2025 19:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761508746; cv=none; b=inI+PwBfOEeMtxCoMI/rNV6J9CRoGC3KSiwKcVjAPvjCq+gQDpibfHinFhLq4mCYzo/z2apwi4xJnQ4yzEdozkcA0dHxpxVeE7cH8Hco2L/oU/QhMT9vqCXgk3UWqSsEdZeiuMlfEYkWD7sXEkc12QlQ86srzt9kuIC+afEGaL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761508746; c=relaxed/simple;
	bh=FLG+vB1Li8c+AvxH0D45MqdCuY+Y/iv97me2Z+7wJbw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZeLFM/N6jDldODxoJ2dnW2BEB9YpoOPzkQousfQLkEdyo/TKM7nxb8PNoENYUaEuoeRPM/R4WpX9d1ZREfQgMSfxHuPWJ5NVNNOp18EFxgnPdOBUNN1SFamZr3WQv01jTNQco93dLNALbvpgmfJEMtJmsR8fI3+ypnrx+9wmT6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id 3E68E1EDBADC;
	Sun, 26 Oct 2025 12:58:56 -0700 (PDT)
Message-ID: <c276bc10-a659-4fbe-ac98-d97096c179b4@cosmicgizmosystems.com>
Date: Sun, 26 Oct 2025 12:58:55 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
Subject: Re: [PATCH v4] HID: quirks: Change manufacturer for 4c4a:4155
To: zhangheng <zhangheng@kylinos.cn>, jikos@kernel.org, bentiss@kernel.org,
 staffan.melin@oscillator.se
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 1114557@bugs.debian.org, stable@vger.kernel.org
References: <20250923022445.3276026-1-zhangheng@kylinos.cn>
 <e0dde746-3761-414e-8df1-eb8557cadbf8@cosmicgizmosystems.com>
 <e605f642-c967-4d41-8145-a10e8f48fb1b@kylinos.cn>
 <365f9f8e-549e-42e1-ac8c-7ff1f42c6977@cosmicgizmosystems.com>
 <8f0155d4-72a7-45ec-a272-7892e783bbed@kylinos.cn>
 <c7aab08b-52fa-41ef-a7fb-118298bb93aa@cosmicgizmosystems.com>
 <e765d91f-3c00-4dc5-ac24-68a5512a0c12@kylinos.cn>
Content-Language: en-US
In-Reply-To: <e765d91f-3c00-4dc5-ac24-68a5512a0c12@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

for v4-0001-HID-quirks-Change-manufacturer-for-4c4a-4155.patch

Reviewed-by: Terry Junge <linuxhid@cosmicgizmosystems.com>

On 10/25/2025 8:34 PM, zhangheng wrote:

