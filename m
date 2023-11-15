Return-Path: <linux-input+bounces-64-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6548D7EC88D
	for <lists+linux-input@lfdr.de>; Wed, 15 Nov 2023 17:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F39F2814B1
	for <lists+linux-input@lfdr.de>; Wed, 15 Nov 2023 16:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B933BB28;
	Wed, 15 Nov 2023 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlZd5o+L"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AAEA930;
	Wed, 15 Nov 2023 16:29:02 +0000 (UTC)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71EB0E6;
	Wed, 15 Nov 2023 08:29:01 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7781b176131so367239585a.1;
        Wed, 15 Nov 2023 08:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700065740; x=1700670540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qx3vpjTb9V9uPnz9xtV/2168OTukcHSXztsVSOdsyO0=;
        b=VlZd5o+LjeCp8ta8ah8fxWow8Zry7xnqCfAcYu7GkUypmoMP/1VzJ+tYPkj5d2X5ra
         qLh+ZV1SUOTnQ3YCRyUMHXuJekYIWrpp3n7HuOy5A9T73K2YxGlRl9mKMXJbULZ+XHv1
         mfwrcBBRaR5d7LoN+6yUWl+md49LF3lY2e7kj+TqLS0igdkB3sHeqITrbPLwBpAJotoA
         k+arGp3ENjWBFzVycke9P+z89646WRGcdw+aD3gRE8oKuHlPhuJFoGBBetK0Kol9S3Bi
         s4p0M0nIEd3QPOIgLW+9Uie6Yl1NYSebQFwWbIDWgpMTzs7c0wUYgcw7l+hA9EZU1eNe
         iQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700065740; x=1700670540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qx3vpjTb9V9uPnz9xtV/2168OTukcHSXztsVSOdsyO0=;
        b=TeY7IyN08jenKfTsO151sQV2dTW+JxLLqNbN2s3eSVgBmWmgqxY62Y0PXff5Lpzf2+
         AsOTtHpCnQ5TJHtkRUdiOdGs3aTULZ2KujrhRrLP4QfPwdn2BdibQ21jMcahrphAIVJL
         F3jCu2bjlGhuFlSR5q/SPSChbxkZyZFva6YI26E1feGGxBfCyNgwM4DeNxvtPk+WN5XH
         soBUCKiCAjP8LkTpipMjrsom4N+R4eOGJ128HuR694Hzk4s8NHIHWCjkNe+xtQTJARU6
         2XY6qiKwRRDJHjQYF9KFDfBKt/55Km5MIzaOsI//BGX2HovQdRKOrW8i4FVisMhVl0gb
         Y08Q==
X-Gm-Message-State: AOJu0Yw4GyiHUdZCCu7p0IhYey4B7XJqnMA4odXPzhGMiw7Hv1EkNf/J
	dIA+C5DvDWyhES+deXUH00U=
X-Google-Smtp-Source: AGHT+IF5NKClhj+lvUnav8OhyXMsa/XqFEZyXxK2HRXBTeJq9vJesW4uPM1z3QXPUZ+PqbfFyQPXLQ==
X-Received: by 2002:a05:620a:24ca:b0:776:f5bb:f2fc with SMTP id m10-20020a05620a24ca00b00776f5bbf2fcmr7066286qkn.9.1700065740456;
        Wed, 15 Nov 2023 08:29:00 -0800 (PST)
Received: from google.com ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id x3-20020a05620a0b4300b0076cda7eab11sm3550801qkg.133.2023.11.15.08.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 08:28:59 -0800 (PST)
Date: Wed, 15 Nov 2023 16:28:54 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-spi@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v1 1/1] treewide, spi: Get rid of SPI_MASTER_HALF_DUPLEX
Message-ID: <ZVTxxrBgR708zC03@google.com>
References: <20231113111249.3982461-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113111249.3982461-1-andriy.shevchenko@linux.intel.com>

On Mon, Nov 13, 2023 at 01:12:49PM +0200, Andy Shevchenko wrote:
> The SPI_MASTER_HALF_DUPLEX is the legacy name of a definition
> for a half duplex flag. Since all others had been replaced with
> the respective SPI_CONTROLLER prefix get rid of the last one
> as well. There is no functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry

