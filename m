Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED0C390A4D
	for <lists+linux-input@lfdr.de>; Tue, 25 May 2021 22:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhEYUH5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 May 2021 16:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbhEYUH4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 May 2021 16:07:56 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E81C061574;
        Tue, 25 May 2021 13:06:24 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 6so23621642pgk.5;
        Tue, 25 May 2021 13:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hrmAyf4ekB8FpoHtyNAMAZhBlwYB6oLMGVhprZSO18c=;
        b=fYNcnKcCLJRao2bFYyvroRFzvd90Tw9noB6EwiHO2huhVZKsPGIltNkWhksA1b+dd0
         M2v+MZGiNxcNvfBagrTHPkglpfKqLvZswqlMNahoFc2ZPYNqPiXTWK5RyLtNLb0Kojuh
         nbkqaQOkd/rRXM1mnJx1H9aa9PxlBF2OW85TmiD4TcJetxOqPx7m3fGJ1YRE+4LumPwp
         o/uTV6kkZ3XDoo7vb8kamyBE2LurBAH9DzdRe6HY+iRzRVm1ZqwdY5o8K/SmuASEWPI9
         Aj/expcKyb6yBG5qzYuzzc8uaTJL4Ouru/aut7S0K7lvmDLfV+FBNxAZrCO4xF3i2yru
         ocFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hrmAyf4ekB8FpoHtyNAMAZhBlwYB6oLMGVhprZSO18c=;
        b=B2UA0j+T6XTBFk9VrK8syM68fCcqHdrYvoJZUNzWOZsLkYYNnF2c6Pf+QrhFAo0H7h
         PDCl/HsykyOXp/0hl7RnGCKd2ZJgl3mqZyoQbwaG/cTwqmxldyEpWjkEZZiwO/2u2EAf
         Do6hhZg0An1yAgOCtBpj0xioepwdo6ZOIJAZswtAsMn+qdUHBBWkJqrKMaUyenbfohks
         XZgAIrkyXX71l5pqWvAJo9ZoqWI13tkSO7v23yjQ/l5BSHx8qB3tQJdL0O/gfaxvkPFj
         cTNQWUn6QHGsgeu9sNX+kSRM9piAi0Jlrk5kTV4vbsXm/eoKCSYdDUx2lWVj5Ybu511j
         V/6w==
X-Gm-Message-State: AOAM533Bq8bLr9bFThVKijx+uEjKwipZyhyIbSN07z52DMxA3BAJkOL8
        dlX974ZvlI+4znwYrKl1Hq4=
X-Google-Smtp-Source: ABdhPJw505JxwnUALZ6tQJnxKexnvtJwEXchT7PYHpC8VmXCsUQaCt5MWOLf3ak1KCrUtxOBEufFJw==
X-Received: by 2002:a63:3342:: with SMTP id z63mr20893123pgz.187.1621973183863;
        Tue, 25 May 2021 13:06:23 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:b993:67d5:4c88:1ac9])
        by smtp.gmail.com with ESMTPSA id lj13sm2639925pjb.3.2021.05.25.13.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 13:06:22 -0700 (PDT)
Date:   Tue, 25 May 2021 13:06:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, David Jander <david@protonic.nl>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/4] add z1 and z2 channels support for
 resistive-adc-touch driver
Message-ID: <YK1Yu3k7alGWqEX7@google.com>
References: <20210525054634.9134-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525054634.9134-1-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Oleksij,

On Tue, May 25, 2021 at 07:46:30AM +0200, Oleksij Rempel wrote:
> changes v6:
> - drop other DT changes
> - add more Reviewed-by tags
> - remove redundant GRTS_CH_NONE check

Applied the lot, thank you.

-- 
Dmitry
