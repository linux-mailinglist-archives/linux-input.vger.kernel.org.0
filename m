Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E10BB23DC29
	for <lists+linux-input@lfdr.de>; Thu,  6 Aug 2020 18:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729244AbgHFQrD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Aug 2020 12:47:03 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:34074 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728574AbgHFQrB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Aug 2020 12:47:01 -0400
Received: by mail-pg1-f182.google.com with SMTP id t6so27146974pgq.1;
        Thu, 06 Aug 2020 09:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jhzmlepFdmy2r2HquH9Bg1monL9cuu4aWWWaAK4BuRY=;
        b=L/OCQO3QVNxIcULL/tzcZgWkmAlzx/5lladJTZs5aN7kLs3VhAtXz8GaLrDp5S9OS+
         VJ+T4+Kn4m7vJbKSNHadWKzn1AbPXMpjCPqpIOwKsFO6Zww1QgxwLeXgywzU3pVMWFaI
         tuMasx83vuKzXzb0UUbR7X4+90n5e+eEJrK/x+LLERqkUb+AXl5MZk3MutJaBVerlone
         bQ0ZxXPaWydj47oNoHzYI3zar2VSXId6q9HofK0/ojpB28BSutknkWu+ErSHrngKNMM0
         DeOjSkDEp0CD8PQAnbW1/NYbfHGuenfXwpY6D4ayhGYrluvao4ZXeDvwjpiHUIqDoiZ+
         SRFQ==
X-Gm-Message-State: AOAM5304k1uyKazE6MCerbxehoTjFCy42+UqjntvBb8utIDdQjxcll/Z
        bWzsp/IakyU5PcxGy2Bd7eVOTA4=
X-Google-Smtp-Source: ABdhPJxljR+2BM3+NLxYnTHpAFI/rfqUTIy5+s1RD0u2NtfsfyOfJFOSZ30o8lRm2APyJKjzexiCiA==
X-Received: by 2002:a92:d985:: with SMTP id r5mr12111148iln.82.1596725393434;
        Thu, 06 Aug 2020 07:49:53 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id l5sm1910747ilj.88.2020.08.06.07.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 07:49:52 -0700 (PDT)
Received: (nullmailer pid 839216 invoked by uid 1000);
        Thu, 06 Aug 2020 14:49:51 -0000
Date:   Thu, 6 Aug 2020 08:49:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        kernel@collabora.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, Ahmet Inan <inan@distec.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>
Subject: Re: [PATCHv4 2/4] Input: EXC3000: add EXC80H60 and EXC80H84 support
Message-ID: <20200806144951.GA839183@bogus>
References: <20200805160520.456570-1-sebastian.reichel@collabora.com>
 <20200805160520.456570-3-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200805160520.456570-3-sebastian.reichel@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 05 Aug 2020 18:05:18 +0200, Sebastian Reichel wrote:
> This adds support for EXC80H60 and EXCH84 controllers, which
> use a different event type id and have two extra bits for the
> resolution (so the maximum is 16K instead of 4K).
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../input/touchscreen/eeti,exc3000.yaml       |  5 +-
>  drivers/input/touchscreen/exc3000.c           | 80 +++++++++++++++----
>  2 files changed, 70 insertions(+), 15 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
