Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48DDD23DC6D
	for <lists+linux-input@lfdr.de>; Thu,  6 Aug 2020 18:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbgHFQvx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Aug 2020 12:51:53 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171]:46023 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729382AbgHFQvw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Aug 2020 12:51:52 -0400
Received: by mail-pg1-f171.google.com with SMTP id x6so11972822pgx.12;
        Thu, 06 Aug 2020 09:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9WzP/qX68qYJ2hNsWrKZ2UF/VOiRo1FGiV7mEAPI4o8=;
        b=UBAj31rUkVHghDVXtjZ0/wVOUkN+aCkneYrWizAVydvO8QkGyrwIoMxW8J4J494VnX
         0F/W/hz5G46lcCNR5mh2esaxXsZfe/Yb6S+ehVdjyIyXZCr4Uucyih7yKFQb+/L8MPHk
         vPB3mQPmGo03pva1ntFRFYrTwSi0YJs/RfWAAoCDcfPgDmlpLPAukJn/i6fJ+O3wC9H4
         MdyzjnOR+WPv6btxeiwiT5Ufhi9zdKXcW/fndA4OXgiblzVhKbz7zO7rxPbMdl9lRPQx
         6BcRY3/MpLxxftaeFYbd0DCz2zgchDN3u4J7OGjgXASG+kH4Dao+XTKuvrJ+58kIIHXW
         cyBQ==
X-Gm-Message-State: AOAM530BAB8rQ0hzlRrkDOIg6rVJ0o2jUrh4FQNIkQaFy94eDjUZWESo
        jrthlPvvf+lL6qyM+eOLTNtqLZw=
X-Google-Smtp-Source: ABdhPJzSi7X3jBLpEqD8SZQol0aayJ75PVEkC6cgKrEGtbOTZR9JvyOCv2zvr0+d+NIejU2BAtVvgQ==
X-Received: by 2002:a92:ba02:: with SMTP id o2mr10384602ili.3.1596725420911;
        Thu, 06 Aug 2020 07:50:20 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id p20sm3847903iod.27.2020.08.06.07.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 07:50:20 -0700 (PDT)
Received: (nullmailer pid 840060 invoked by uid 1000);
        Thu, 06 Aug 2020 14:50:19 -0000
Date:   Thu, 6 Aug 2020 08:50:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        Ahmet Inan <inan@distec.de>, kernel@collabora.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 3/4] Input: EXC3000: Add reset gpio support
Message-ID: <20200806145019.GA840006@bogus>
References: <20200805160520.456570-1-sebastian.reichel@collabora.com>
 <20200805160520.456570-4-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200805160520.456570-4-sebastian.reichel@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 05 Aug 2020 18:05:19 +0200, Sebastian Reichel wrote:
> Add basic support for an optional reset gpio.
> 
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../input/touchscreen/eeti,exc3000.yaml         |  2 ++
>  drivers/input/touchscreen/exc3000.c             | 17 +++++++++++++++++
>  2 files changed, 19 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
