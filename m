Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502881D055E
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 05:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbgEMDSf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 23:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725898AbgEMDSe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 23:18:34 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58677C061A0C;
        Tue, 12 May 2020 20:18:33 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id b8so7128423pgi.11;
        Tue, 12 May 2020 20:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Cm/gLrcNvamQ/ORBmoqkA6rGd8BbqmVca6uk7B4BbCY=;
        b=CCm16ZBTqRwqYeQfcCF3EXPmKegJwnu5MDeXF0bs/Ry70ZxkRwUCxGhJXY4N/hs0vJ
         4z2hkKif+oTUugaiYU1Xbr4LhBLbdYLfQe0WUOINr0yFc+8fUylKR3TDKWB0181JhTwN
         DBj/I+Np414BoSX38Mf1Tuh7CubrkWN1BFfvK3b9YpjGNLqKKGcOQrypGqJi8ieymf8U
         vk9f3bCktg4h6CpamVJv6X+0zgJ8lLztcVGCps/pfRt0v8ayM/0LW25PW7X2bOmmEMHu
         isyduvAXvdOscTkIcQ7+b1dgkhGgL8uE6sKXvMQhmGdTJHapI/ntnivdKSdYYbMjqVIu
         M86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cm/gLrcNvamQ/ORBmoqkA6rGd8BbqmVca6uk7B4BbCY=;
        b=QttRvLHgyzQmsgMK+Ms81vOY5oGozHq7310d57uojjHdp11QP2SxdK12T4Ya51Uds7
         LgDm2u3T1RN7wOChEuJ0aVdUMhsEME9YdUWWWtExYEl8Nx2DPAzpTHe0eGtMFdkt4t/d
         skHBTrUCNMzSakoUgKoBJF3CNyIcIMc3fIEmAXrdiRVCb4A/VX+/umGbl0/HR4sMV3YY
         uCDEfSGJR3MT2emNS6HXNeo9qPgt4MrgfSa5CCbmiAV7qK7DzcVJedfoUvQ1b396H1YY
         aUDYrvG6Jbt36B4RfC/7l32IpiIonLi7aTpL55whYf1LDajKYeUaIHXdI+/0mixPFvqW
         15pg==
X-Gm-Message-State: AGi0PuYNhr95/RdzDwjxkgyQUvEj1F0sKAlCaTNCcr/pKvP6VBaeSOWx
        nFOhp7RQdR+Mj/Gs99QKoj8=
X-Google-Smtp-Source: APiQypJ8rBf4hAMhnxkEj0F+y6GDhhYHMRpKIHQNOAOgI35XxWa6jkpORCLj4nE3KIbMGvzP7t8+Nw==
X-Received: by 2002:a62:3381:: with SMTP id z123mr24705858pfz.274.1589339912779;
        Tue, 12 May 2020 20:18:32 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id z60sm14459408pjj.14.2020.05.12.20.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 20:18:32 -0700 (PDT)
Date:   Tue, 12 May 2020 20:18:30 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, sboyd@kernel.org
Subject: Re: [PATCH v2 RESEND 2/2] Input: remove msm-vibrator driver
Message-ID: <20200513031830.GH89269@dtor-ws>
References: <20200513013140.69935-1-masneyb@onstation.org>
 <20200513013140.69935-3-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513013140.69935-3-masneyb@onstation.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 12, 2020 at 09:31:40PM -0400, Brian Masney wrote:
> The address referenced by this driver is within the Qualcomm Clock
> namespace so let's drop the msm-vibrator bindings so that a more generic
> solution can be used instead.  No one is currently using driver so this
> won't affect any users.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Applied, thank you.

-- 
Dmitry
