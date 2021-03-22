Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91211345334
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 00:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbhCVXrs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 19:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbhCVXr1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 19:47:27 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26088C061574;
        Mon, 22 Mar 2021 16:47:27 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id h3so12356874pfr.12;
        Mon, 22 Mar 2021 16:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GwaKFZW9otNTNyIWH06rwvuC3/890UF5YZzPK2f95OM=;
        b=TYZwWhru5GuVFWhQF7fKwzvWo3m2328rrhPcuOK+ydA+19+SUiPW0mcQAxVWPuXu9X
         qRBwRowXpwTS1HtUgbTavCfhjRy7I0wHw3rj1q5AxpYIq+UL33Rm2vJzGN2P+zogcUfs
         V33NZMJxmDwYhBX6vrN4g/qEC5XFjrnRHx/xs2ERZ5JRzmQDdKLWadaETwVrQDW28f4k
         KuMlj3wbIB0v1Lv+VoxmAZE8t7udCnrxaDPIKdUElxXIwWnCGe6FVAi5/miHYwFBjETP
         YFz1bp7VN9Yg/BT5u5r1vlZFWueRMKn/brSIJxxQdBYjcGdvpl/s+cydO3h2eROwpPk9
         ZDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GwaKFZW9otNTNyIWH06rwvuC3/890UF5YZzPK2f95OM=;
        b=KixMw25CqBsZKG3CpSjL0hppsuSmU1Yc3sQAB1oH8ArBbjdvWnedI0aogGNj8Iqq6y
         24A8YpZBOFBZMOC+lknzTrqrq9OefpTzJYOt0B/vsmRSKBgoZQONmYjRnjKhnKRiKOgq
         c52BcaohQZraSK91wFO2lmGVl0JhkJlux5JHM3hcxZqUmf1N4eRwhl876c/ogLhkmTgL
         3Q9Djt7SechCflYrvqZlngkSP19mWPHKX860PBbExIzRNZ8xAgbSz1tGg+xkgIyGvJcD
         AjpCIxHzJfR1tyVX51/lOu+Zv9jX6Mrhun14r07qY4I/lsCOG4XzdIsmsEy912qYdGQr
         w85g==
X-Gm-Message-State: AOAM530Ne3mXx7hq2B3HoXKNiz12DXQFRLsrBcyckpx85mkYSKDpbzPp
        OLASGAsBN6l2/mRniRZzNmV7Y+UB5As=
X-Google-Smtp-Source: ABdhPJxeTQqt8NUny7fCfDLV7l2rbkuqNMOB14qoFmrq8J42/6GT8HH/vi/D5FbnuCy4v+6/LP8CyQ==
X-Received: by 2002:a17:902:d201:b029:e6:bba:52b3 with SMTP id t1-20020a170902d201b02900e60bba52b3mr1965514ply.51.1616456846705;
        Mon, 22 Mar 2021 16:47:26 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:499f:7361:582b:fd05])
        by smtp.gmail.com with ESMTPSA id s3sm15386423pfs.185.2021.03.22.16.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 16:47:25 -0700 (PDT)
Date:   Mon, 22 Mar 2021 16:47:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] Input: Add support for Azoteq IQS626A
Message-ID: <YFksi3fBatz4quv5@google.com>
References: <20210301234928.4298-1-jeff@labundy.com>
 <20210301234928.4298-5-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301234928.4298-5-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 01, 2021 at 05:49:28PM -0600, Jeff LaBundy wrote:
> This patch adds support for the Azoteq IQS626A capacitive touch
> controller.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
