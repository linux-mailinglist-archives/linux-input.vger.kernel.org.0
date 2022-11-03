Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 534E0618793
	for <lists+linux-input@lfdr.de>; Thu,  3 Nov 2022 19:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbiKCSdG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Nov 2022 14:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbiKCScl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Nov 2022 14:32:41 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0271DA78
        for <linux-input@vger.kernel.org>; Thu,  3 Nov 2022 11:32:04 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d20so1676692plr.10
        for <linux-input@vger.kernel.org>; Thu, 03 Nov 2022 11:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uwlF1iEY/Y6SHqPIIy3Y7RBx74GRRtS5TmhpUmuKpas=;
        b=AE5sF8mQfIl1uTUoaPc1fprStZFde3rslMbGso9bRxQx3Zy+Hhygh5oACmOMnUne9/
         D06y5CywYINqI2G1PibSby8pQemYA+RWwG9GDZLHS1dyLhHj5tnsR2QSmC/dPdKYFiC+
         7PrgpV2uhkERcJMWQaWHn3HnIeIrgHHrS183ohy5h8RCyk9r29svW8QiM/eKoE81tQ8U
         qg63LaTm3mivrLJ56CdUFNXkCpCNXhwuCJrrVuq0qtShiTxthQcCgIMdKqALFIn5adTk
         IgQi9e5o4CXc14QnqR9cjQIpbX8Xz/z4PfcasHNJqolWjTpI4Y6QYlNS8IZzMxMVxWd/
         CEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwlF1iEY/Y6SHqPIIy3Y7RBx74GRRtS5TmhpUmuKpas=;
        b=GtceZBpeHbOY3if5KfpwAv2Vhqit375m4chFs48jLTj15ZJFG7LYr0D0tHUyuOwbqA
         XjXz+F9c3LEUrsWRqrZ1hxfEkykgRSnHUT/+mV/Gu7wPKHBQYoYqx0cC3mjb8THJwfEz
         yN4Pa2y5fHBg1kDUGpWB1o0ZBW4e6DdWfiau1OZOs+rWNFulqog0hmNo7GOoDqLwWHi2
         iR6UY/4yce9zUncS4+tc4PVXwXpjLFPG5Jrnf1kZ6fDZ03RQqOM5IpPTOzryGegiiNcA
         2RLH1SAdhmOUQLEDcvq+805LZzpd03hobsbW/kBdpoGGxxtv8XjhQGPmU2dRKh6aXlNo
         WcNA==
X-Gm-Message-State: ACrzQf2F/QxA4f4mylo40DS4y7ehM187IPFOfpEJ7e8dftHhwbPJT7g1
        /GtTqfXqT/XRKJlCvsNkwYA=
X-Google-Smtp-Source: AMsMyM6CiZueTn0IBNpZ0dKnM9W+te7RlmAHURbZNxqAufIpzXn/EVeVqVn0YaIaTcP7NKcbx7xCEw==
X-Received: by 2002:a17:90b:3144:b0:215:db2e:bc6e with SMTP id ip4-20020a17090b314400b00215db2ebc6emr7001813pjb.12.1667500323989;
        Thu, 03 Nov 2022 11:32:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id l10-20020a170903120a00b0017f57787a4asm954717plh.229.2022.11.03.11.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 11:32:03 -0700 (PDT)
Date:   Thu, 3 Nov 2022 11:32:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: goodix - Try resetting the controller when no
 config is set
Message-ID: <Y2QJIK445jj1s9FB@google.com>
References: <20221025122930.421377-1-hdegoede@redhat.com>
 <20221025122930.421377-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025122930.421377-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 25, 2022 at 02:29:27PM +0200, Hans de Goede wrote:
> On ACPI systems (irq_pin_access_method == IRQ_PIN_ACCESS_ACPI_*) the driver
> does not reset the controller at probe time, because sometimes the system
> firmware loads a config and resetting might loose this config.
> 
> On the Nanote UMPC-01 device OTOH the config is in flash of the controller,
> the controller needs a reset to load this; and the system firmware does not
> reset the controller on a cold boot.
> 
> To fix the Nanote UMPC-01 touchscreen not working on a cold boot, try
> resetting the controller and then re-reading the config when encountering
> a config with 0 width/height/max_touch_num value and the controller has
> not already been reset by goodix_ts_probe().
> 
> This should be safe to do in general because normally we should never
> encounter a config with 0 width/height/max_touch_num. Doing this in
> general not only avoids the need for a DMI quirk, but also might help
> other systems.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
