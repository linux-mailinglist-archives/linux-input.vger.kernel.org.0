Return-Path: <linux-input+bounces-11924-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD7FA96DB6
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 16:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 818E61B60EC2
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 13:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E2828D83F;
	Tue, 22 Apr 2025 13:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Km9AvSw9"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024B128CF6C;
	Tue, 22 Apr 2025 13:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330245; cv=none; b=edAh19edSVLFvZbMQXyYXg5KZe0Z/OFACOz4G65BHKP1NSHPBZx44RW9K6tAWoY2gjIwbvirAVdFzGCi+zKKwvsx14nIaNYfzCoEjbvbxl3OodjSFRFqfSdlzIDIIF5dpiX6huvs+TFSUnt7hmP4QOT931y5Iz4vQAsDwH0CO4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330245; c=relaxed/simple;
	bh=3HjoS5e3QU+v9bALr5IEVa7suvzaGRQTCuFxHuwIrxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=juvXVi5EfIUXPEkvttfhPju27e3y4IHC3jCLblyS4TIv3QdhHIP06XRtOtZASJDeWkRRr02WXeWUkLBE5ulB2eu1NPiZeCkUFQrzFVSrxp9oIe4zwv39sffC23UnvH8KBo1DpIy4vUES2fB2nZl+gVmOmmCMVJZpc851fo5Fdv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Km9AvSw9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330242;
	bh=3HjoS5e3QU+v9bALr5IEVa7suvzaGRQTCuFxHuwIrxk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Km9AvSw9k5xL11mRoZYS5VzbLI1joRRwhbv/LaEKn5JNVa7OSwKlVWakqGSky4suM
	 za3cIYBfmZMmv/o5JnQWHTNeJ5Zux1xffnlw6er3fathERGpQrGUYpVYCYWQCQmoje
	 lU0jlrilxRP5ZPdBccl3s6bKXo8bG1fHExHfDj696IABrfwHzbzkXFHJeyYDVboeDp
	 sycEd91TMj8U86InbEJhAWd7oYxnVMH63NU6EDRay+/3parwiY/pqoPZQorKW+XHPa
	 ctIxhHIwVkB/dzvUqbgtLQcaJvlv63+ZGz/3GnvGfeFkNNrZXmL/LWdV2vbD9wNvMy
	 6AeNqjfwyXs/A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 583AD17E155C;
	Tue, 22 Apr 2025 15:57:21 +0200 (CEST)
Message-ID: <58b7df32-9d08-4281-9532-d374cf096eab@collabora.com>
Date: Tue, 22 Apr 2025 15:57:20 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle
 Chromebooks
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/04/25 12:12, Chen-Yu Tsai ha scritto:
> Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
> Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



