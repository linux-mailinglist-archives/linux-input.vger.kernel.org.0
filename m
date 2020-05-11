Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13121CE883
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 00:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgEKWxJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 18:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725854AbgEKWxJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 18:53:09 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6418DC061A0C;
        Mon, 11 May 2020 15:53:09 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x15so4828841pfa.1;
        Mon, 11 May 2020 15:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UX1e3G5pICdv5Su1p/sHdO03fKVIDVMRh4AFP2GMseE=;
        b=racU3yOERnVSf5OhYIkc9jAWD01kboHgb3/lbfpBmxiO4BseFcRMIOD5Qsj1l54O2W
         dInXhd+J48W54qeuxmwuxZ+OkDffW91DIOwh3wlQl+c1w/LuR0TsSdMgK2sKNg/ViBqs
         iTxnpY8gCtlKIjZk8q1keLzQvvN5fpJ1xlrMrbbsIUeKFd15azTSduXc+4FDS7gdV4B4
         tIuJXYh1m65ngKWHOZNsOisb+qu/0XB1VLyhiI6AVvaJ+4Gphk58tT8r3ZDDdJYCD007
         B14939Vvj4g5ZzfGTNMfxPTz8b1q9XkJpYeq8W/dOuG0O90MWtm9OMceFnK/B1/2O7tX
         T/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UX1e3G5pICdv5Su1p/sHdO03fKVIDVMRh4AFP2GMseE=;
        b=DeYoyt9/FNwG1RRb6VSyjjY9ZxSehm3gpxjJv5nDfB4ZBTcQjLtbuTKU9cDgKDGWSm
         y1fGvJTIN77uLl+sovSzc0FGm37ux7p4KgQUYvkVglTnTZdkS2Eb3dYV0fQHsvYCtvB1
         17sT+BwFYobpMtKMK1l2nxbAwYbAwTYgDXEgvaCtv9eNcdIqsilC/uxrG5u+UNltYrd6
         ryHMzu7J5UXF16L6gL3u0+GCUxy1RywPjShPhm8glry+0iyJlbuQIIEtY+LS5wwKBCm2
         /NQ0Gvak3toHZLKYIFwUe6p0pFwsZt3n9nmcTroZf54wn69vKoutVMFhyVB5KuMO43dn
         TbHg==
X-Gm-Message-State: AGi0PuZZY337iZny/+JjTe9NVUBCEwKC97730n/0u3zoM/kdtsLoRvRR
        QNOErVeAfMWFUe/Jk0l0/LAMaMLu
X-Google-Smtp-Source: APiQypIszNkyW+FWifA0HmCJUvh7Uj9uFZ2z4L5r4YQV4AKx+rnH9X4sw3t2EssDH5XhvS6wM7fwSA==
X-Received: by 2002:a62:1704:: with SMTP id 4mr17344633pfx.197.1589237588718;
        Mon, 11 May 2020 15:53:08 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id gn20sm11094498pjb.24.2020.05.11.15.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 15:53:08 -0700 (PDT)
Date:   Mon, 11 May 2020 15:53:06 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
Subject: Re: [PATCH v11 07/56] Input: atmel_mxt_ts - implement T9
 vector/orientation support
Message-ID: <20200511225306.GA89269@dtor-ws>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-8-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508055656.96389-8-jiada_wang@mentor.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 07, 2020 at 10:56:07PM -0700, Jiada Wang wrote:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> The atmel touch messages contain orientation information as a byte in a
> packed format which can be passed straight on to Android if the input
> device configuration is correct.

No, unfortunately I can not accept this. Please convert to the proper
format for ABS_MT_ORIENTATION as defined in
Documentation/input/multi-touch-protocol.rst 

Thanks.

-- 
Dmitry
