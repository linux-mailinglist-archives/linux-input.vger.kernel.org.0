Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F191216311
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 02:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgGGAkM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Jul 2020 20:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgGGAkM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Jul 2020 20:40:12 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C51BC061755;
        Mon,  6 Jul 2020 17:40:12 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id q17so1585598pls.9;
        Mon, 06 Jul 2020 17:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5pYsjN60NJ47D/Ig9H9v6N4wpATsBohPpYZDtHcHnWg=;
        b=KPAdAAqxaECfbaIMMLlyVjjbvG+1HW+YC5dbtcvGnh36Y1dYKeCMRX65Ed422fO66U
         fvTnCV5nRBjPvID0tuQfs/6RbJqwqByhFiC1ZoWMjxBvKIe1M3K/wd4/Ql/STKw7ZHoJ
         4HEUC0mtxyXZWsIJ5WWY0XtMlBKHB6/aOL5JJULCG/ikgLDlkHN20/SDUFdFLyJ2y1A6
         dn87NxZ0iHoqLZIIwOAqk0r0iXbkc1FtCochtC58PNMxjPAfndNlHSjuAqdDqbgIRck1
         gPy/ChyBbwha5z0pyNZmAnS/lXIm1xDzXtBnDDZoxxhZcKlqPmBcMXfzZ9WvQbIqymv9
         m70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5pYsjN60NJ47D/Ig9H9v6N4wpATsBohPpYZDtHcHnWg=;
        b=Q1mhrLadkMEbB5ikfO2QthCXe8d2lcDAn2AzG8t6Y52fVJlt0MPQIkYArwJ76L4lQJ
         CXjjLnZC3urCmXlNDa/ztuIhrNl0gRVBGT3BRzUbJdnxEYT404DVidattJmSoSCNrJpE
         kliiQ5k5gkb7qPCHNTnCIjdfuVtiNitkG2d+zWv2nN2Y5hHbVeCyTCMhcvcZ7r99u1ds
         mj0RMCUrI/s71WjCy8cGKozv8mF8Qp8M/wwBIYGxx0OtNP7rA1Mol2VOXGbUc9fpAXO3
         3KIXFc5kd6Tk58ZQLvjun581mZB9TjO16retA1JXeiJVcsabPfF29Flf9xjHskuNeuKs
         dpaQ==
X-Gm-Message-State: AOAM5328okXVrHDHxskwHVn6dIz0N718z0bFknzKtjj28YoJY+LVYirU
        sUuFC6ao7K4fQ9WY5puaHOI=
X-Google-Smtp-Source: ABdhPJyi2JbLC/ZDrwY/hX3+vuEPEEQ5oxgLAUew7kQokGQYn9wtyMxVOPBo75lqQ34HqUJNeA8ZCg==
X-Received: by 2002:a17:902:b086:: with SMTP id p6mr7825796plr.164.1594082411944;
        Mon, 06 Jul 2020 17:40:11 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id m22sm5601703pff.152.2020.07.06.17.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 17:40:11 -0700 (PDT)
Date:   Mon, 6 Jul 2020 17:40:09 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Derek Basehore <dbasehore@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        jiada_wang@mentor.com
Subject: Re: [PATCH v2] Input: elan_i2c - only increment wakeup count on touch
Message-ID: <20200707004009.GB3273837@dtor-ws>
References: <20200706235046.1984283-1-dbasehore@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200706235046.1984283-1-dbasehore@chromium.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 06, 2020 at 04:50:46PM -0700, Derek Basehore wrote:
> This moves the wakeup increment for elan devices to the touch report.
> This prevents the drivers from incorrectly reporting a wakeup when the
> resume callback resets then device, which causes an interrupt to
> occur.
> 
> Signed-off-by: Derek Basehore <dbasehore@chromium.org>

Applied, thank you.

-- 
Dmitry
