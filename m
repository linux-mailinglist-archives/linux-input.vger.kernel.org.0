Return-Path: <linux-input+bounces-14837-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B591AB83106
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 07:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C343F3B04B2
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 05:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46FB2D6E5B;
	Thu, 18 Sep 2025 05:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyV3OBci"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037A82D6E7D
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 05:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758175112; cv=none; b=ZBAI74iG5W4jl9zey45sj8UT0sHOwNOQ1NbetWwuMz5MITr7fzIWI8pTHfkx6JsULnWspnPW4dcR6nKzw3vyYR+vG8mupvf8LO0rgR+LvHBuZm/fV1lvYgroSg0+RMk43aio0sBjz/bfA9kFG9/CMB1R/RGgK4uHXdSGRpK8ECY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758175112; c=relaxed/simple;
	bh=e7yRxA2B68UWIKkdczYYijQsT9ZC4h4tFwI2brifv3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyK15P4CIt2hC1kV2dK+u0A3bHOofC5B5QWc73GdnuIGDbXufOIsaMNmfLDQCG60IK630VoBy97t+SaLSXCBjrUcZyhCWp1dBuAIJJ9/FG4XFz30+0bZtAf/edCsgTBlWexpwZjfEL4YHJD8dJXTmKLiN0YDVsTWAnyrmUxINwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyV3OBci; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7742adc1f25so468320b3a.2
        for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 22:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758175110; x=1758779910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1M8K/x0sWMdi+p7zlur7P/Abek/ld1zdxtrufjSounw=;
        b=TyV3OBciB6qhzJ4DdhcCjulEYOnOExKqaLoQAsOiTfqpMJMwVuXNZWAYksnXfxBXqT
         1Y8zu/glvqt9pd8bJOah8UvJMmL06zfGb0cdh//qOHw4NxaFbiJrdFooqKkHgxdn91hD
         EtbCeHaxl4naGo4FbxipOHoMuUufnoM/x3eiQoVZEyIqkJJE4qnvvBLbusOTiGpcjmcB
         EvtJ67UN6uk32YgrA25u4W/+vRkvgkUr3YLwIWGD23oOWbuU9aqHR0yJL6U8GaiI1RHs
         XbFA77Ykaku74TFvngzrM08k6voUHeIetAT9cHlsQxetKZUv9QyshrHB+DlMrmMqCwGd
         EYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758175110; x=1758779910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1M8K/x0sWMdi+p7zlur7P/Abek/ld1zdxtrufjSounw=;
        b=hqumF6Z+OHNcXpbgDkOqZ00J+0tnTKW/8GrTSdqy6Zw7X2Dn3HNtWFxV/f9BbIPUAz
         R5spsAj2Ye9Sj6EZRFPiQr3qEs8MIM8NcxFnqt54iO2S5dyWr5ibSg+E/ZVSjW47AoTo
         dz9BFWCtHbp3ZM04jJUNslXNkFH0tOSw3zOoBdZAk2t5AsvE8rqtMoE0LymcQ3uqemVs
         q9PrQZNGCqrc9BU/RHcIf+XCa6jz7uIb1NSYNT7U5Kq+WESmoJSyssI8slKSHn2Gt2Um
         kGLNVsbip0GKs+V56BXjtbWR8utwbE7PVKACdIi2r7fpJTklcCXBo1CXKZEQQfJ1oyM4
         8rtA==
X-Forwarded-Encrypted: i=1; AJvYcCUoqNo4C71xPGbttVW3ke+9Hty9kV+gz3Aa3KYxEswLwxmtYS/vBiy6U/5Djp8IIHTlCYm9KxBF4ckNlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8YZs3/kvf5S+iYpDDrT7sGSN7iT4yI9cIZg3M01CiLKnJ1j6b
	5z+MBSQm1YijLgoqviICLN2/0OLJrKienHmbJw+jVnMGUj+Pz3VbvyHj
X-Gm-Gg: ASbGncunJEu+T7NcyxmHceIaWqaPZXy2Gg1IaQ0OGIoPWMswFPJDRrXY8SAAxVNDaYb
	mABZMwiyAMawomdXb6xJk/FVRe5zVkdDnJQ07P02zLj+I25dZc7kGkmzeOqNIcIF+XcklPYGwR8
	cgsmjXtf+7bPux/znG+t0duNLq9cLVktYdOvhBSgI6rqr9QRLxdHIqI1lwrboQdJwnpr4c7jxZw
	HLuctZzt+YlB6nyJ6z6BhhVef4MablvQYvtkLxdIbmhskaYbupqC72YkkT8BYw+IfkxErV77WWD
	cD8o+QRaOK+Bm9FAsX+kN7tlNGhOfh14LGhNCNlQyzsXmZPiNwcw96mx2yWjFUbSYOqTMFWs3Ky
	RawCbKUgOg3H8c+uoG1NB2lMYy0zuZditeKBfZhk/1w==
X-Google-Smtp-Source: AGHT+IGb+rdTMfwVbcT/i/JK1WiLKpQvT7aq4HHFKHQrPydPEVY0k2OXSVn7CE/ZKWO3IERNaHMXMw==
X-Received: by 2002:a05:6a20:748c:b0:271:cdbb:4d26 with SMTP id adf61e73a8af0-27aac3da5a9mr6725643637.58.1758175110263;
        Wed, 17 Sep 2025 22:58:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:194b:8358:5c91:3d3d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff4002edsm1199838a12.33.2025.09.17.22.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 22:58:29 -0700 (PDT)
Date: Wed, 17 Sep 2025 22:58:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: touchscreen: resistive-adc-touch:
 change to unevaluatedProperties
Message-ID: <wbwtlcrlwnvvjyv7cnffu3sltrqfaddjf5f6dzizhgglwskjgb@zgxjfm5oafxz>
References: <20250910224402.994046-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910224402.994046-1-Frank.Li@nxp.com>

On Wed, Sep 10, 2025 at 06:44:01PM -0400, Frank Li wrote:
> Change additionalProperties to unevaluatedProperties because it refs to
> touchscreen.yaml.
> 
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: touchscreen (resistive-adc-touch): 'touchscreen-y-plate-ohms' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/input/touchscreen/resistive-adc-touch.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

