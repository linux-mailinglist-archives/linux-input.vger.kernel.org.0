Return-Path: <linux-input+bounces-15108-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CCCBA10B7
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 20:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB40F1C21809
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 18:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F1831A06A;
	Thu, 25 Sep 2025 18:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9y6B6jq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F68F31A053
	for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 18:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758825437; cv=none; b=jCl9FLIGftcwB+0Lipn68yN/JZIj7yXqFOuRKMSExrIzxlr7bi/zN8pBxHVXo2katHWTyDsMQiRdM0aVAij/5E/hq3xUWh2NQvom2MUHdOrCF5gKFU1mRBOfY2ElkJA8i4Es6GIWvm6tG1rRSgur2bmSy7ogX0OfsCfdfudSLNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758825437; c=relaxed/simple;
	bh=0Q1cTjmZ9Hi0vHDbIbYb1a3iXAlzjO74mKnKxout+90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AR+ChbG3j2Jo+pEEQ7ICCoGa/PTb5wDVkSlvPfXqUI2VpzIciCzWF64gNPvgC/7foFuEeEVlQLa5setw+7dxycXxXYaVJVbIQoSr58axQ/iRtlooFNiXcm6eaHQb6JHXr/Ctu3x8MTnGIDFV0ZxJcHOTKpGndKXXk6GQ27yU8ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9y6B6jq; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3324523dfb2so1216139a91.0
        for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 11:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758825435; x=1759430235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ejaK95uuDfPzMcPS0W0hlWY6j8PK1ad5B7aVSF1ED4s=;
        b=V9y6B6jqC/iT0CaRu+9dT91/aK5IDDWeZ5A7TkgDpekpUrQ/PEM0AJQUjqn1Tr0zgo
         EFa8/MD/PBLiEzEPsw2afoMMZFdhbTa7bvSBu1SzEdsDEYeKJNwn30QPzxKUx4e11cjk
         44Q1ieR9GJam2ZlgPPQnbxNgo0RuL1JNLYyrI5UFWjs7OEZK5QfXqulMDuL77njA0EmT
         U9txg5Hh8OkVxu1fL1QLSmNfrApk94/UqMc0jMbYV7nZ86PsjeLOSMZfW7VUSQY7HFQ0
         jiWq31Dl06pYJT0QSrL9gVLwlXCSO3b6f3Etuxc9ptiPzYE2TYcMWfuYF8bzNO6R73VM
         Ib7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758825435; x=1759430235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejaK95uuDfPzMcPS0W0hlWY6j8PK1ad5B7aVSF1ED4s=;
        b=X6gfm6W1v3tcqayNzegc3qHMjW2WruD55TNQ36NfVCKHGNaP60sg3EvbJ97E9w3+jB
         rU+4RQBTlr7dO+skQeJ0tGK/TgXlZZajHdUuwy2/EbhZop54qeXE93z8WpQ8ADjKlsVR
         3YHFhy11JMlBU+qxIyisg2bm5GujhPMKTneU8QtbJpCfrzOwkh9DCLQuhOmCeJos1Mna
         m6tHPGa+JYmf62zRIv+E0oSX7Zkzhbkp9dPVaHPm5NTrEWojfYRSIuA9JImt5oneHXyN
         E1XyLlERd2YZ4+Z8+6vOZq+cPmc+FOCT1PDXN2r6cyItA5q7uUYYue8ECCfhw/u8xoIs
         U99w==
X-Forwarded-Encrypted: i=1; AJvYcCUizH0zcYy7BOQYK0wwICtn8qf4xibuNEZwQA8eFVjtH8L9tdOSWXqHFKSGDWyhMOmXzLxR34C3YqcKbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcjuoq6p+7t206YW5TJ5fwutbkWTCED6ocCotmp6TATMgzJnua
	WczFDmPn58vv4tcL2jKj3YLmYNfWGSu9aF3dJC6CKJDuia1zXdMyIhG1
X-Gm-Gg: ASbGnctZe+CYzpVLD29jO2w9VR2cqgF73PqpU4T7CKUXmcjnOI3NwvdMzOqkY4Xyg1W
	DBBgMQNl3eaRuRSZDz5Pocj2r41EAL5p4KqjVGwZCdbDtmghRufM3kG9uPhKqJcyF5cm6OD7nfq
	DM0uetIuLdTXaZ53+1oCexBR5ggpgDYzfd7GdskL8ebCX842MBbMtIJ0d9FMPF/j5Pi0ySqp7kt
	Mq2vYYgJrN9TF9Xwxz/nwvBIMlMnCdmLvW8ohY7/G6c3oxf7ObHiCWgdhWeDWC23/gdYCtR5Fwf
	dEMlIHxXSuaL8RyN0Q3WlxY+SjHFs+5QU3MS2aq6hBE1GZAFarG/AJn66xgSYW0PxJom3kr4Yv2
	WgXR//QARDmI7pltxunwZ1w==
X-Google-Smtp-Source: AGHT+IFQ9L/9odSQ7gc7JHhUpQDD9t7I9o/+eSPX3b49TgfFSepGgPL/WvhMnEIO2E2EA+RGSnCEpQ==
X-Received: by 2002:a17:90b:4a42:b0:32b:dfdb:b27f with SMTP id 98e67ed59e1d1-3342a2bede7mr5384154a91.17.1758825435565;
        Thu, 25 Sep 2025 11:37:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5a97:14cb:a5e:6c78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be383b4sm6480831a91.27.2025.09.25.11.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 11:37:15 -0700 (PDT)
Date: Thu, 25 Sep 2025 11:37:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, sebastian.reichel@collabora.com, 
	linux-amarula@amarulasolutions.com, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [linux-next PATCH v8 1/3] dt-bindings: touchscreen: convert eeti
 bindings to json schema
Message-ID: <knegehuffheb3sxbo2vu567wnv4htomsvkqnw7b7skwtiru5tw@7rwf6vrwrppx>
References: <20250925153144.4082786-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925153144.4082786-1-dario.binacchi@amarulasolutions.com>

On Thu, Sep 25, 2025 at 05:31:33PM +0200, Dario Binacchi wrote:
> Convert EETI touchscreen controller device tree binding to json-schema.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied the lot, thank you.

-- 
Dmitry

