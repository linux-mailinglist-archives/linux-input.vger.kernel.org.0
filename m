Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7473828577C
	for <lists+linux-input@lfdr.de>; Wed,  7 Oct 2020 06:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgJGEOm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Oct 2020 00:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgJGEOm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Oct 2020 00:14:42 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08913C061755
        for <linux-input@vger.kernel.org>; Tue,  6 Oct 2020 21:14:41 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id u24so583308pgi.1
        for <linux-input@vger.kernel.org>; Tue, 06 Oct 2020 21:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4oEm+yxw/ZlYSfSyBPNAfuWBvEn3ckRUg7q0tsEp1s4=;
        b=qIBIxz41NxgLQnGO6r2+IB158LHEcc96tKY/MUWwXBrMXAtiUWOdrXMcmuuWsolE6+
         e2OpRxK0+7lbytn3CEZODTWh7kX/Enzgqpkz0Eeldvp3ARMJF8nVWsKVOcPpWkMUH6ff
         vIQlLS7YrP4dFfadcTkcNf3XPJjg6V0ylVAKAr1f6bIwRiW8S+rYCRSR0/hJljY9+j0B
         b/hY6DxOGRy3cTYp8PyJs5rBztbboTLmgVxJJE/OHHkanY3gJg7KEFNMhPQ3xN8Y7mSb
         JSZmS3XmpJJm2kHdqcI0Admlxk0zszw85W2e9FZUe+uhGy2e0b8OzUGYq4qLUY17cmKa
         cDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4oEm+yxw/ZlYSfSyBPNAfuWBvEn3ckRUg7q0tsEp1s4=;
        b=KfkIgLnteQcBjqvU1PvJjKjMNO7/iEjSr9Dmfiz2lGn2LGLB0rKCLpvcKybPr4P7bd
         MKqOJwksKalXpzq/7AnWsbjCrIpRIHPDGcWOWVV6VerGqGr0RGxHftwyuRXvl6LlC2w2
         zmJmeLaDZgvWSgoDgJqNptpryZ86BhrD0Z3L1XupJN5w2NKwNynM18sHvzlg2j5RaR3Q
         DbtWRRFq2o4NFd+OKyojOU+qqpvY8ZNin9kpUjwABsj6NVDQ2pNbw8MflIdwXhf+BLCF
         CnqmL8zFzcOuXnYmEDsaYqk0dje+s6gIg6WojyNgffG4Gi5/4V6ZNF8K2IYL/jLpxa2T
         lbyw==
X-Gm-Message-State: AOAM530ZhBGenOJgB1I/HF8+IRy0I8kFH2uh44zCcn+ErlaPvDkRdmnf
        plRa/R2AaBfzXFWn7Gv1p90QMn9+3JBdLQ==
X-Google-Smtp-Source: ABdhPJzlmntxpywOkj5UGAKnCWaTpHSdH/7sOSpytRCHPVidOCPXMRJ/Eq1SRIZ8LVztcEMsHCNiIQ==
X-Received: by 2002:a63:1849:: with SMTP id 9mr1289247pgy.393.1602044080415;
        Tue, 06 Oct 2020 21:14:40 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 206sm848446pgh.26.2020.10.06.21.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 21:14:39 -0700 (PDT)
Date:   Tue, 6 Oct 2020 21:14:37 -0700
From:   dmitry.torokhov@gmail.com
To:     mika.penttila@nextfour.com
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Add MAINTAINERS entry for SiS i2c touch input driver.
Message-ID: <20201007041437.GV1009802@dtor-ws>
References: <20201007035108.58636-1-mika.penttila@nextfour.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201007035108.58636-1-mika.penttila@nextfour.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 07, 2020 at 06:51:08AM +0300, mika.penttila@nextfour.com wrote:
> From: Mika Penttilä <mika.penttila@nextfour.com>
> 
> Signed-off-by: Mika Penttilä <mika.penttila@nextfour.com>
> 

Applied, thank you.

-- 
Dmitry
