Return-Path: <linux-input+bounces-15140-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 110A6BA6814
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 07:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68CAB189A000
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 05:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C02293C44;
	Sun, 28 Sep 2025 05:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhqbWGta"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54A12848A5
	for <linux-input@vger.kernel.org>; Sun, 28 Sep 2025 05:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759035717; cv=none; b=GFkGuncq0r8w+8X5ZyQUaNxOeto0sC7nYjnQqmBGTiHysvDmpYRchvMdGRkQu+8Z+UltUqW0iM9Nogtm8jqs4/K4KUkr9JekMqXuOLsR9PR+OqIJMnhKZvjRjYiElkFdhjNi/qQvWTEPXmvR66665fSq2MX7amwj0QXqXCtD9io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759035717; c=relaxed/simple;
	bh=2KAdNtvOHAv0iPsSzF6JnRSyf3a/6LV1XFGg4SXH3dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVT/AHK5bF73KLUqWly03mOOKt8bIpuNnNCqx93v8/yss/ymx6OeL/f7ZKmSg1ZCzLHk6GthgAVu8J0bepOldhF/nKww5FGyprazIIaFk3377GsIZL1lLpETovSjmWMYPQ0koepR2LmbYVEVGzlKPCZtO2/rLeSKEJW0OAngTg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhqbWGta; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b55197907d1so2653086a12.0
        for <linux-input@vger.kernel.org>; Sat, 27 Sep 2025 22:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759035715; x=1759640515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0U89y2eMhj2iLIuruto3nVeAxA529zvX5Wm2O/HQL8Y=;
        b=ZhqbWGtaxUckOZSo4F4tbV5mdHQNP93rvyc5CDtQc828TQYK1P/Fu6cwRu2T6IgQHj
         1HRdfX7ogs82Z3WcwJeu64ibnmZb55Ls6GmwoIxNdQd9v1UmLxWCeCI+F4f81Fcm5XIQ
         RB2T74MK8Junbjh4pJQ0tXhAFAGsEQ6U5FzGxiVVtS2wZ51i0lhVWEKNpd2g6IAuzyTu
         EF7mUtmjeE8FbLpL+3OLTc3/Bzon/GuG+GViechN1RvOVvX7rhnAQGOEePa1KWez07CT
         60itKa29/s6bevw60s3zK3n+a0+c4xc0xe9QP8YGbRdQDZtxgrM+tMrvpeFI6vKwt+BP
         sDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759035715; x=1759640515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0U89y2eMhj2iLIuruto3nVeAxA529zvX5Wm2O/HQL8Y=;
        b=lWmX7XkS6xNFs9Rhql040lkpBdlBZmOnwgxyneytV5XwbRm56CJTLNDLXfAGx+0sYc
         xj3F8q40JuEyR/YHpCGsCLbhTK9jeSlHdzJkpSjl0F7Ynmz0K3dOWAT2GdEHcSsBfJ01
         sxzdDgMaT2JiiM0SA6ENmZev3DmUEXpfgXwScW2qv0l6LSbyWHsJO2ER0HckMq3h+73x
         85sKe18Gf9h41E0wq0s2zgjcJ8dLICnBRd7nCkD/OCgt618tr355Ab/Fpo9fWb6B4bx/
         vHvD6CHwCqA5PP3mO9CPUOy+QMCRPJYKH/uzbUObuDV6J5ej4Kd5DNxmL7fyqSaSL/iV
         3vjw==
X-Forwarded-Encrypted: i=1; AJvYcCXjKFZUNs0YT+1twmN7tzEKPYgJOacXvppFjjPkS3Y0s14aWkghjwDQkNw4tbRGhauL0t7/ffH5uEvmGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQL21fhDayxIz+9gVBAf/sUsgIfTJuFa0UIdCDb6ZCB9u3FfO4
	po2SPfe1nt7fYfVkArPhToAvEuQ4S9LpgT3MODZYJEcApoayMGo8w5qeTeG+/w==
X-Gm-Gg: ASbGncu/G6JbqeNyqR9Hbn8h+EOF/I17ddP5OXy07UU6RgY+OF/zqj6+9Qd5oYOKSuI
	D4WlDLfe95wAbGt2fhuIighndfO7624U/4Kh6l4Ypqv+M4xhJ6Z/FHuueseENcZp/auhByy6cGr
	P+QblHDyYuh+kcixuopaCLunyKDvTlTanoVU1mdWYOyncNwXjtU2GbLCgLNWYXFWWB2Gv3uSUqf
	7LFXkL3lz6NwUTQjuVaG760v6UtYDc//dONQODbq13hdj+tDHQX/I6HHMDU2ixLUrG2jK7HCoA7
	A7s30yu5hGYeoaqDbzMASM2sQhp6YFyuwQslbTf/YkFLYQZbEmJcn0WoHAS3/7WCfT3d7Sk7Ce1
	Js+dy1rEg5SgiC1lEznjdp91uWSXBM4WkPDl0pH5SMoLvO3wADMGjjcVV00UVDRo45dnentyc1W
	AcP2jhgT68
X-Google-Smtp-Source: AGHT+IF4gSMaafr65leHEt79++HLMxBmNFlxKbU0qyU/KcJdtn6/e0eUVQSCjElsKiida6VyLQveJA==
X-Received: by 2002:a17:902:d2c1:b0:269:96db:94f with SMTP id d9443c01a7336-27ed4ac8880mr159569835ad.49.1759035715125;
        Sat, 27 Sep 2025 22:01:55 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:22dc:7b49:8c5d:38f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d43ecsm96573425ad.24.2025.09.27.22.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 22:01:54 -0700 (PDT)
Date: Sat, 27 Sep 2025 22:01:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v3 1/3] dt-bindings: input: Add Awinic AW86927
Message-ID: <rudd5cgaft43bjllspx3cb7wmcqe35cirtwfuf4b3kcntpxjad@4un73z7omcwc>
References: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
 <20250925-aw86927-v3-1-1fc6265b42de@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-aw86927-v3-1-1fc6265b42de@fairphone.com>

On Thu, Sep 25, 2025 at 12:07:28PM +0200, Griffin Kroah-Hartman wrote:
> Add bindings for the Awinic AW86927 haptic chip which can be found in
> smartphones.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

Applied, thank you.

-- 
Dmitry

