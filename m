Return-Path: <linux-input+bounces-7863-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EA29BC4D8
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 06:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25C56282FAE
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 05:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5F51B0F34;
	Tue,  5 Nov 2024 05:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dvp50KFx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF303C38;
	Tue,  5 Nov 2024 05:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730785612; cv=none; b=iIC60cVz2LQr/MBHpxJX6eeNIcSJCo34OPDRhSpBy1bpHH+uba9gAr+D76huLNGwn3qpCrp99VjCsrv8d+1yYriBMAXnpZyQFo0l35YrOQW6m9RPVyoh6+XvQOhgDFXtxxmWCPLLtAsGYTscqbQOaAW0GN5Uk3XXHUkupOE2QfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730785612; c=relaxed/simple;
	bh=xAzUDywZKQPMpMw0VK0SPIO9fJ2AxNzdFtNDLR40znE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAs0r2fmWl0cgQhZISFpQnVDAVTUkrg0JygDge7cToR7dyAVDsQzm7YRBdA6KFsb4Je2R+0K6RMYkFdy8kzLZ36ZxoeyY6exeuRyVSI8UhysAqeis7stG5tV80Pogek5KLDz20Huwm5tCTk47va+4WMIGYsQb3R40EFyZkq9WYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dvp50KFx; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20c714cd9c8so51161585ad.0;
        Mon, 04 Nov 2024 21:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730785610; x=1731390410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ3MsO+VqupqUSyCDbDTVvGIv0RLAXVcI62ESKiKPAs=;
        b=Dvp50KFxHSA9qbxkqcUtnrU660X+eihnp7gPOOuiUoangfJmvzsoyhFlxXmCnvi6kJ
         f33voOf7ocEWI2tyvMvakjeYQ9Ww8YESySnSKIBuczw7xrrmd1G3HIl2gikpBwcOah3S
         BAgIThQHHkYQjVUhOIyDYtbLqbQvK1KUjsZQ5kmoLR+WPaWozYS2wGu/Yer4ca68CWvE
         CDbaiqYEN/9P1kVHouDJV+KonC5wUlZIvcWu5ravU0Q2Sq5WOB63jBG4eoJjyuj/JfeF
         vONnBMdqm6LsIr61Ntrvveytw54HXFxgHITFPu6eZkuGIeXZRWAT9jgb5mb8/Feym4Ax
         C2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730785610; x=1731390410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQ3MsO+VqupqUSyCDbDTVvGIv0RLAXVcI62ESKiKPAs=;
        b=XTKolGLd5smm7ENfQCePLWeKjgob46xXUBzENyg9pjqUGZZwp2pnYxdDmKbL8vkDzA
         20ZFCw/Kf+EK1PbykcMQB4j/FTGw7p9YOv4Kv+y+kptSr8wvPXN/HSPQ4X9dSgaB4Dd2
         JykqfICJmfFHb1hpuMf2uNTBIyoZz2dJ3Yf8K7VGcEjL8CN3nld0lrdwUo+G9bpZOQWH
         WPZbcsLIzRIybWhwZbTUDbeenSoXceeV/SzKNR1w/x2+iNLsrJjOphkI0I8QhCTK6VWd
         3ZuiF/ALTvech2zJBMYUcikRimNClke/iUcaJD+PwGaZC0uioG7yxLK3GdUgyEvjzSJx
         ljiA==
X-Forwarded-Encrypted: i=1; AJvYcCU02PSW+7AjboRCz9XIenJ30NafLeimH3/AaLkhLs7wqqz3KMnCQn/OVrhP/xSAUphINRNntEtjQvsLTXQ=@vger.kernel.org, AJvYcCU2ML44LbzDSxBQ2E0zfqOGTvMGWUsB+WsK7BnOwtPXES9dvWQqG9vObNX4QjY6aAGn5GPZQsonDete@vger.kernel.org, AJvYcCUyvl4UibDZWB6BEOEA43BZUxG8leqlAYgYizLeauJlLzfRXng8sZILOAcs3B8ey6iUbUJh4m2rz9SwRgYf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4100dAvkwFkimzUwDIYRWhQerBi8a2U82gJbW94hd8YT/+K9V
	1EnR/veVwDMynvPnx/68mHDhe7aUisY0CPvyoO+OBHXMV+GO6INC
X-Google-Smtp-Source: AGHT+IE9a5jo5P5KUlzLWpuC2Zl8n+cZJP3AlShz+KMqRe0Q34rzGLMVSV9CGSwJREC2oa5VEzA20g==
X-Received: by 2002:a17:903:1c7:b0:206:a87c:2864 with SMTP id d9443c01a7336-2111afd6ca6mr174175725ad.42.1730785610450;
        Mon, 04 Nov 2024 21:46:50 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1bb4:1f23:1031:ac0e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2110570891esm70215735ad.104.2024.11.04.21.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:46:49 -0800 (PST)
Date: Mon, 4 Nov 2024 21:46:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: rotary-encoder: Fix
 "rotary-encoder,rollover" type
Message-ID: <ZymxR3yo_wnU7MC0@google.com>
References: <20241101211304.20886-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101211304.20886-1-robh@kernel.org>

On Fri, Nov 01, 2024 at 04:13:03PM -0500, Rob Herring (Arm) wrote:
> The user and driver both indicate this property is a boolean, not int32.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thank you.

-- 
Dmitry

