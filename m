Return-Path: <linux-input+bounces-11919-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A246DA96DB1
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 16:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 372463B25DE
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 13:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDE9284B5A;
	Tue, 22 Apr 2025 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GA1kGS+a"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595C02836BD;
	Tue, 22 Apr 2025 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330240; cv=none; b=ehoHe/R28Fe9KLrf/f8FZXxuvy8lCgM9N8sY3bjVVdVb7xydcFuHsMx6CF5dVROnj3GhS5JaliRyQl5DLJeIbpUg7hxWS8URdcIF9Jzgn3uTkQ4Gp/TzWitOmOyexX9SlS98QRxjeopHjWA+juQ7/5f7GVF2xwy35hmzMosMKH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330240; c=relaxed/simple;
	bh=pEYZNWoFEdBBLfTxI8KEWcSIIsXy0HkCrm/lKlOqgRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aSkbdAR3C9fnvWcJ4iJjHOuvaTGvm6/yofk6mGuTc0vQKgiXX65WNN7L0aJVnAOUMYaTGn1mjq7EOnFpSXsXaIsKgw91+WBO18xOvenwdt6N2opym+F9JWnlk/Yf+Xu7kxpWxL/G0rU16YBXHVWylMLozipYVPS5so2TqSzB2rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GA1kGS+a; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330236;
	bh=pEYZNWoFEdBBLfTxI8KEWcSIIsXy0HkCrm/lKlOqgRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GA1kGS+axLianLnoYAw3+24QgQ4Ss+cR227t5EjGyUjm/zcczQrtALsXa8nz4TuCf
	 jM1kD4r/ZTZM2VK9yCG9blTjEFPolBsXKgq6/hnBC5AFY6fD+sBwEnGFSfOcAKXu7J
	 DJBpgXHqaolvT6CrPYr/B7dv9ftsgK22GqeLbDOkXkhQexuMN/UI45KK3BUjMyw+KQ
	 EYHsOV48jdHfXyX0zsutLEA7XJcaJjutaO/PkHLyPd+dbdMPH5a3T5j1sMyXkm1WxQ
	 drymcvxRfVxU1DSdAxx9E69Lj0pnlO2J9wm3ZssP0iPQnFmVfwFPdAAZBLPnwtcyp9
	 F2VByXFpKfOVQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 969DC17E155C;
	Tue, 22 Apr 2025 15:57:15 +0200 (CEST)
Message-ID: <71a0c25d-5168-40ae-9957-1e1782e7765f@collabora.com>
Date: Tue, 22 Apr 2025 15:57:15 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] platform/chrome: of_hw_prober: Support touchscreen
 probing on Squirtle
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
 <20250421101248.426929-9-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-9-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/04/25 12:12, Chen-Yu Tsai ha scritto:
> The MT8186 Squirtle Chromebook is built with one of two possible
> touchscreens. Let the prober probe for them.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



