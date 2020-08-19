Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84CE2491A5
	for <lists+linux-input@lfdr.de>; Wed, 19 Aug 2020 02:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgHSAIu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 20:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgHSAIt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 20:08:49 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6915C061389;
        Tue, 18 Aug 2020 17:08:49 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p37so10509010pgl.3;
        Tue, 18 Aug 2020 17:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Cqj3JHaqnrJFkMIO2+78Aoe3lTOzW4rxOSItuV6igWQ=;
        b=M9OyR1dnDAR+aD97hRZvu9dMwj9hmHRrMKkXiLVlByxvP08ZNMf8ojXnSukeCsuC91
         DS2kmpRhnH1cD29L/8KmzLv7kNxk1DXMt70a3OrAxGm/5HWVwoP/Re5xKx9PxyK4hM8K
         o+UjRGOyTZjFnnz9N9/IHt22WcSJfAAlup89B+Wap97S8WzVtGdqecESJEtnp978MKiX
         9GjYvVDe+3vRu3PlzQdtGsyqnkzML7tbB2EwhGfpfgByDlp+xFLd3j7nNRPAxObp6sVn
         O47N62LHFMn0H5HGI+UOleaU/qhriEkbcouDDObZM0yWQSvbuSAumabIqHgk4n0EMt4S
         6R/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cqj3JHaqnrJFkMIO2+78Aoe3lTOzW4rxOSItuV6igWQ=;
        b=Y/I5BZjAVIb3FukuttkB8c4w8IA7ddNhKenWHwqCPmLWIxEoLamMT/5tpuH7EmghdZ
         r2iRnNz2fzabVZWt2Pjh2D1r9wkhIuMmJI8v75hNkNVWGYge73hkNQKvdqM6fF9ZMF3l
         euJRlaSR4Aq5ZdMSvniHErOY7mVqQfBqOzasHAyF37mmKrvVtaK1M+VfSMLWiarG1Q59
         tR0p3rXLxrXkFkE9GM1t0LO18oNHMrjlrWbjN6KrlrRD2byMv4XDS4zRm1fkhaGo+sq2
         ACMSLQWokeKxyqAESXbSZPNTWqvtBCHIgUfAHKyPQALthKE8VpFlBFW4w5aLSgCegWb5
         GlHw==
X-Gm-Message-State: AOAM531mq4lVun2oXN7jU7k6cijqpXtGbW7xSmmJsE5c19moBGWXAj4w
        NeuljTbfRN5ObuSLolw9oTk=
X-Google-Smtp-Source: ABdhPJxYkLBotLh6mg1c2biaKWwcwyCLvB4Z15DMunV+250Uxk1nDwdAYtkyf64vINJzrcDNslPZnQ==
X-Received: by 2002:a63:2546:: with SMTP id l67mr15136826pgl.281.1597795728621;
        Tue, 18 Aug 2020 17:08:48 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s8sm924557pju.54.2020.08.18.17.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 17:08:47 -0700 (PDT)
Date:   Tue, 18 Aug 2020 17:08:45 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Furquan Shaikh <furquan@google.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        adurbin@google.com
Subject: Re: [PATCH] drivers: input: Use single i2c_transfer transaction when
 using RM_CMD_BANK_SWITCH
Message-ID: <20200819000845.GW1665100@dtor-ws>
References: <20200818234215.2255611-1-furquan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818234215.2255611-1-furquan@google.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Furquan,

On Tue, Aug 18, 2020 at 04:42:15PM -0700, Furquan Shaikh wrote:
> On an AMD chromebook, where the same I2C bus is shared by both Raydium
> touchscreen and a trackpad device, it is observed that interleaving of
> I2C messages when raydium_i2c_read_message() is called leads to the
> Raydium touch IC reporting incorrect information. This is the sequence
> that was observed to result in the above issue:
> 
> * I2C write to Raydium device for RM_CMD_BANK_SWITCH
> * I2C write to trackpad device
> * I2C read from trackpad device
> * I2C write to Raydium device for setting address
> * I2C read from Raydium device >>>> This provides incorrect
>   information
> 
> This change updates raydium_i2c_read_message and
> raydium_i2c_send_message to perform all the I2C transfers in the
> function as part of a single i2c_transfer transaction. This ensures
> that no transactions are initiated to any other device on the same bus
> in between and hence the information obtained from the touchscreen
> device is correct. Verified with the patch across multiple
> reboots (>100) that the information reported by the Raydium
> touchscreen device during probe is correct.

The devices (touchpad and touchscreen) have to have different addresses
and therefore should be able to operate independently of each other. Are
you sure that the problem is not in i2c controller implementation that
mixes up data streams from 2 separate devices?

Thanks.

-- 
Dmitry
