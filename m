Return-Path: <linux-input+bounces-4594-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB27D91471E
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 12:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 357671F210AC
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 10:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C75E136643;
	Mon, 24 Jun 2024 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LepGv7H7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0AE3BBF2;
	Mon, 24 Jun 2024 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719223828; cv=none; b=AldWKZxRENdvTTXPruAiZrMesAZYK19oBnTnK6jGQwOVnPjxWTy5QqpX4jE/+Qxb2UucefcCVbng8/+OjsFYuePWWb1HKurmCzAq4IOPZygXIIjhA6+lc8nHIzOkgQGWkqXFXbuOfF69sMe9Xsi6f5MDJh1JWynay7H4jwscnmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719223828; c=relaxed/simple;
	bh=scVGa1MRN1RkfvP96gtjMP9mba8xgHdiodS6IHhTUHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7btT33PxXodgfELpbB9A27RbKLkkST5QkolZmdEhOKjcs/xTQu7Kog+dwM+Vg++MrMYi2bLsELsgEgefouY1xnvFtM7au5/0yfFbKuexADz6ggXIf8217JrRUQisJzPig5koRZ9WeSfq6QIIznxZaVQ5RZFAW/GoQkQG7frTp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LepGv7H7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f9cd92b146so32190125ad.3;
        Mon, 24 Jun 2024 03:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719223826; x=1719828626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EmkWOq+vi8o8UsVtQJBxJjgPpIFiVV6OClCfC0Rntuo=;
        b=LepGv7H7Qg1s99YK/HYc66KOE6vreIdAvFo9Fdo3xghF/zh0BolREiOTV7588h4WU9
         lDZcr+qAle66DmlAkWGbCba3z9hckJ9RZ1EhypPI8zOFdcuo5b3KB0bZKFSEt5cL+c6e
         WBYZTIppjLhyl+R2ICU+MI14i6fpBjT2k0syFjjTGHVtASGw+4ZiPq4VkoQqkNExOhdh
         d3SiXWBk13KMjBHm6S3YrV9Y8oBpGRwxFGZ3YRnyxlAQeyUw4EM5CW2pIvuoHDvoxB3Y
         Xu6d/TqPzl2vfHZoqkKFS8Vze95tqzbi65vyrhwUNR6yUCVb8uOpXonckSnZasMqcUpP
         awFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719223826; x=1719828626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmkWOq+vi8o8UsVtQJBxJjgPpIFiVV6OClCfC0Rntuo=;
        b=w8zuPd9WolwDaAmfoe4v8rZH+ZWetM61hyOZwuHwQJ5Td8d4CDJgzDjx32tpdPNMPa
         K+Hj1JuaZHgLumAsKoaypZ+yin6lH7pS3jIKJSxCbphirTBgHWnT57m3eIXLZnwe6sdb
         xC8KtUt408lSET2Qj79GtnVb9SZqqruBbaxC4qBtzwqUlZ+q0TpclKB49dyEi83bgVg5
         53N8E6R+0NUQ5FBM1qoP2Um0Y3E5Lz/pOf3RNiI/s5j33Qyt3dwT6rcDTz6HDetmwek7
         yp8B33uDwjySCYzxqw8BIzO2YAk3ThcSfns6OXVTef5nfwMDl5j3OD7Nvzd+fFbXYpKi
         lkgg==
X-Forwarded-Encrypted: i=1; AJvYcCUMnV0nEAVLFMEULUMXUOwo22kY6uuxmmPhzl0SlZI7RWuVy/LD/5k7eIE2NfXxj3eDqRij0biaARHj1zw+fhyjrxPijV1SLKjE7KSmMNadH8QemvbmR+qB3IrpcRbHnMOJXOwdy1+BTaTVjgyaQDTrm+yDvM7GeZKRPgRzB5xuHpRVj9JU
X-Gm-Message-State: AOJu0YydoZo9d0LvN+Gw5PR5Cav0wV3ISzNICVBgqU5nBdLRcMfBGjdz
	u5Maoip7CW7cdgeHJr6ziXBXEYzzEIOFd36vYdgJ+TEDDDonRLNOoa/yVm6+
X-Google-Smtp-Source: AGHT+IExyh9XY/uAa+ex+R6L6mnS7JnlV6BzaNmrYWFmyNLbz/1fEXQThjdEUJIyuRW+0lmscIB6Pg==
X-Received: by 2002:a17:902:ce82:b0:1fa:1ebb:eb79 with SMTP id d9443c01a7336-1fa1ebbeee9mr64889935ad.58.1719223826247;
        Mon, 24 Jun 2024 03:10:26 -0700 (PDT)
Received: from ux-UP-WHL01 (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c5ec7sm59033725ad.141.2024.06.24.03.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 03:10:25 -0700 (PDT)
Date: Mon, 24 Jun 2024 18:10:20 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: dmitry.torokhov@gmail.com, dan.carpenter@linaro.org, conor@kernel.org,
	robh@kernel.org
Cc: dianders@chromium.org, krzk+dt@kernel.org, jikos@kernel.org,
	bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] HID: add initial support for Goodix HID-over-SPI
 touchscreen
Message-ID: <ZnlGDCcNch475wWA@ux-UP-WHL01>
References: <20240618084455.1451461-1-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618084455.1451461-1-charles.goodix@gmail.com>

Gentle ping...

On Tue, Jun 18, 2024 at 04:44:52PM +0800, Charles Wang wrote:
> This patch introduces a new driver to support the Goodix GT7986U
> touch controller. This device is not compatible with Microsoft's
> HID-over-SPI protocol and therefore needs to implement its own
> flavor. The data reported is packaged according to the HID
> protocol but uses SPI for communication to improve speed. This
> enables the device to transmit not only coordinate data but also
> corresponding raw data that can be accessed by user-space programs
> through the hidraw interface. The raw data can be utilized for
> functions like palm rejection, thereby improving the touch experience.
> 
> Key features:
> - Device connection confirmation and initialization
> - IRQ-based event reporting to the input subsystem
> - Support for HIDRAW operations (GET_REPORT and SET_REPORT)
> 
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
> Changes in v5:
> - Add additional descriptive information to the dt-binding file.
> - Fixed build warnings reported by kernel test robot.
> 
> Changes in v4:
> - Allocate memory based on the report information.
> - Added a new function goodix_get_event_report() to retrieve report data,
>   reducing memory copy operations and avoiding the use of reg_rw_lock.
> - Add low power control operations.
> - Implemented power management operations.
> - Introduced GOODIX_HID_STARTED to record the current device operating state.
> - Add OF match table.
> 
> Changes in v3:
> - Renamed the driver file to hid-goodix-spi.c.
> - Mentioned in the commit message that this implementation is not compatible with
>   Microsoft's HID-over-SPI protocol.
> - Modified the driver to fetch the GOODIX_HID_REPORT_ADDR from device properties.
> - Add a lock to prevent concurrent hid feature request operations.
> - Optimized the SPI read/write functions by reducing the number of malloc calls.
> 
> Changes in v2:
> - Fixed build warnings reported by kernel test robot
> 
> ---
> Charles Wang (2):
>   HID: hid-goodix: Add Goodix HID-over-SPI driver
>   dt-bindings: input: Goodix SPI HID Touchscreen
> 
>  .../bindings/input/goodix,gt7986u.yaml        |  72 ++
>  drivers/hid/Kconfig                           |   6 +
>  drivers/hid/Makefile                          |   1 +
>  drivers/hid/hid-goodix-spi.c                  | 811 ++++++++++++++++++
>  4 files changed, 890 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
>  create mode 100644 drivers/hid/hid-goodix-spi.c
> 
> -- 
> 2.43.0
> 

Thanks
Charles



