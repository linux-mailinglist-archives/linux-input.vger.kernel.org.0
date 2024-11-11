Return-Path: <linux-input+bounces-8003-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACDE9C370C
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 04:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D0FD1F21FB0
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 03:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49C72E3FE;
	Mon, 11 Nov 2024 03:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2Nc0Pqu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AED93224;
	Mon, 11 Nov 2024 03:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731295983; cv=none; b=FVjf2CdjyKW8gPe+QX+c9Atxyctle0pFEBJVyRmT24ly1OLBuz8FDQxqzwKKht8f5EZk8gieT6//Wv584NpUemFVfgiOzz8uon1MuBVyT8ysB3P5fdWynRfqNsL9aLxKcVHF+QDIO3i0cpiytwKCjjCWX4ajowOwIX1tUfuhdhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731295983; c=relaxed/simple;
	bh=119Hr1JV4i6FMGb96EppLEBoxsNsOhaqmgWDTTe90uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJ6usEwYE0VciDRmLAbmJPihZnhTWOhMIoqsGw+F1Dis/LDOnzConib4w13j2vKg0hhi0qkdzJE6DO7crFAAD5EruhQLQgNpCuSdLmKBHrFlIlg2pLKL1dgLvnXU7lhR6/P/1A3GKwL/BGhcmAqFp4YgeFttXw6lg15zg9TNatc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2Nc0Pqu; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-720be27db27so3228552b3a.2;
        Sun, 10 Nov 2024 19:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731295981; x=1731900781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vnc8iSgBDQYpuhzLmnUqf5r3aqtYqrFe99ZE9Wq4E00=;
        b=f2Nc0PqubZAcTdYloLuHhF7fTKFO8be9B4t0fBs1mGwuLZUCyBzkSlgdAYotoWc5Vm
         AZ0yOmbFC1bOiS3xvo8vAsKZ8m6ENiEKY/PH91RSH+Jv8XYC+VZBoBpCiRIooa/KHJc0
         0SoTf4rcTBA9T46EvL81NjozvkW1SbEhbMQUeOaCFBuCkjAPEpCLlpVMpQCNpxvcCaJJ
         b0RIY+AF75PtifVA74XPvaRlFRy+JNOwzq4VSxBrU6oUasHDBxIUVRSgmmmnm/V3Gau8
         zEYNPvTdyZ8VuZuY8cTtnjxvzPbvb2VjVuHsgcv1ga82naNumzSGFGgsuO6jSkK7YI0g
         sCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731295981; x=1731900781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vnc8iSgBDQYpuhzLmnUqf5r3aqtYqrFe99ZE9Wq4E00=;
        b=IA4EiwsaoO/3iLdIlorc22XhrWj5RzqwLeF2jKR7t6TPGHY23/ahCqDVCTjl0iqCJl
         TTPsNKB2iRE4CPEW6qfyJb38va61146SDYRPywuBY19GTt0M1OBSw5yE087WzzwFM60D
         UAgrGNEm1nb93EYImxFnEi9u63Ftt0XTw+LahBVNO+59GLIxmjajsPVcaiZolqRmZ524
         eOkLwORj8/dAdLV6n+8JP+o/yR/uxlYwNCDAuJTMTUgt8xJBPgaaAU49zv/OJsc8NWwO
         CuDLjyJmaE1pRXVpzzBkgW6tBHSHD4BPyasPTXnJH/BVj+lo0CID1F6Gbko6gV5HDDpE
         9LKw==
X-Forwarded-Encrypted: i=1; AJvYcCU2Zf6iJsWMV4LMhkUiiWljnAYdRy4sCNaJHecFbR6DTXs+9IupK0OTczIV09cmAQQC7rXbaHULXIMBPP4=@vger.kernel.org, AJvYcCU4rdN6DYo+n1UygoeymkbcY8rewdZOZrs2R9cMAw02aeUMd1daLzeWSMckSL/70NQ2QJQakc2SPoeM@vger.kernel.org, AJvYcCWvGtee6Ds6UOItSqb6gqYmFX+pStRB2OwXlDaCklq/HBKNc2yCSwY7fQ9IqAnpzucHXLn5SDuPHnKIgFBG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+RgFrxn8mSk/KhBvHQQuFN8hnFMPx/Hwx5UL49VpE1Za2c13i
	lr7c4akx+J8wrG4oaSWZSbqWP23uygw7gbODlojy/L2T9QVhH4hl
X-Google-Smtp-Source: AGHT+IGubFMG2Haoksb9EuHa8ZAmXouEspyoNaKLDaAT0/mWoTrLOyEsuSJlqQxDDW5RgatsdDRVaQ==
X-Received: by 2002:a05:6a20:7f8b:b0:1dc:1:3e28 with SMTP id adf61e73a8af0-1dc22b91363mr16340372637.40.1731295981434;
        Sun, 10 Nov 2024 19:33:01 -0800 (PST)
Received: from ux-UP-WHL01 (mailgw01.gttektw.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5bbdecsm7465503a12.29.2024.11.10.19.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 19:33:00 -0800 (PST)
Date: Mon, 11 Nov 2024 11:32:56 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: krzk@kernel.org, hbarnor@chromium.org, dianders@chromium.org,
	conor.dooley@microchip.com, dmitry.torokhov@gmail.com,
	jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: input: gt7986u-spifw: Remove
 hid-report-addr property
Message-ID: <ZzF66AChXkYTSIlY@ux-UP-WHL01>
References: <20241108120311.87795-1-charles.goodix@gmail.com>
 <20241108120311.87795-3-charles.goodix@gmail.com>
 <20241108161350.GA2313139-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108161350.GA2313139-robh@kernel.org>

Hi Rob,

On Fri, Nov 08, 2024 at 10:13:50AM -0600, Rob Herring wrote:
> On Fri, Nov 08, 2024 at 08:03:11PM +0800, Charles Wang wrote:
> > Since all boards use the same address, drop the goodix,hid-report-addr
> > property and hardcode it in the driver as a default value.
> 
> Where's the driver change?
> 
> I don't see the point in defining this and then removing it in the next 
> patch.
>

Apologies for the confusion. The driver changes will be included in the next version.

>
> > 
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > ---
> >  .../devicetree/bindings/input/goodix,gt7986u-spifw.yaml    | 7 -------
> >  1 file changed, 7 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> > index 8105b9ce2..c9e346a60 100644
> > --- a/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> > +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> > @@ -36,11 +36,6 @@ properties:
> >    reset-gpios:
> >      maxItems: 1
> >  
> > -  goodix,hid-report-addr:
> > -    $ref: /schemas/types.yaml#/definitions/uint32
> > -    description:
> > -      The register address for retrieving HID report data.
> > -
> >    spi-max-frequency: true
> >  
> >  required:
> > @@ -48,7 +43,6 @@ required:
> >    - reg
> >    - interrupts
> >    - reset-gpios
> > -  - goodix,hid-report-addr
> 
> Dropping a required property is an ABI break.
> 
> A devicetree that passes with the schema will not work on current 
> kernels that require this property.
> 

Thank you for pointing this out. The next version will include the
necessary driver modifications.

> >  
> >  unevaluatedProperties: false
> >  
> > @@ -68,7 +62,6 @@ examples:
> >          interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
> >          reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
> >          spi-max-frequency = <10000000>;
> > -        goodix,hid-report-addr = <0x22c8c>;
> >        };
> >      };
> >  
> > -- 
> > 2.43.0
> > 

Best regards,
Charles

