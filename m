Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A88A567961
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2019 10:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfGMIwk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Jul 2019 04:52:40 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42808 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbfGMIwk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Jul 2019 04:52:40 -0400
Received: by mail-pg1-f194.google.com with SMTP id t132so5574100pgb.9;
        Sat, 13 Jul 2019 01:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ye7CFB+RNkDFFPibm62xijLFC7byqXV66LMUUwrJqM0=;
        b=iPRiaoV0fDW3wzE3blxO0+ssT/u9Q759YjTI1r+tgcGM2BbA5Do9nTfkEN0ONYbn+V
         53I4ALG6Z/7RjE/+DyLNaeusK+5f+9I+VhY7MVOH1PhiA57E833ya/AB0+2Gw/k44Lh9
         fwVYmRaHKeGMotizenBdVYpJXp1RmCwX4xNgrXP0PkV8ggiZaUDrmC2vfSb5zVRmcPcK
         yRPw5LbO83UqO8e1ShKshujfPwHvQ6fDjJoYl3HQZ+U5yGinFrJvqcvjBXDd5q2SVw1O
         XGRo2G6Wo4p3Gedj3YbcqQ79+nmXU1MQ2TPP0Hprsl5xIm/kb4OpK9nbvK93JAY/sOWi
         U6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ye7CFB+RNkDFFPibm62xijLFC7byqXV66LMUUwrJqM0=;
        b=kmcN+iVgDlH4ab1xIqrMayjZhz7foJ6/yr1hi/Eo0BQjxvoBG0L40R1U/ngdAfStrM
         d2G63LU+qLGz//ehi9reSIySRUvaSgMyIvvBhrIp4NHxO3ImM6azd9zTFcwakHIjA5FG
         kqUJu4GQH30PFuNJo2F/Ir/w5vvYmdyFTtFUO6Rp8c/Htwu8/DpF8qlgOfenlSCBEgbK
         z3/TyXGNqRX9VBFhcdBMWQbTb3bPiAVk+40xe721UDbbWYeoY1rOn8+unwCM80dBrUDw
         Pe1dWXWF/arGWcrqj4DGRpJ1p6LPyF9muxhn3ZMugIjl2t7+L5+YoeF/K6Kjc0JaAXsO
         OUcg==
X-Gm-Message-State: APjAAAWnS+eZZtt8i09+aaa/4k26xlwBY+EPbvtARU3RRJl4+mYf/QZ6
        9p/FKrF/d9YUrcdNKB4fQBo=
X-Google-Smtp-Source: APXvYqx6hKtqvPf/5rj5ZlzNfmxlQOhbG8hlM0MVQ1gmkMLShdyDqD6erkpobstYhZDxzU6MRerNsg==
X-Received: by 2002:a17:90a:8c06:: with SMTP id a6mr17499768pjo.45.1563007959665;
        Sat, 13 Jul 2019 01:52:39 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a16sm11385795pfd.68.2019.07.13.01.52.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 13 Jul 2019 01:52:39 -0700 (PDT)
Date:   Sat, 13 Jul 2019 01:52:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/14] Input: cyapa - Replace devm_add_action() followed
 by failure action with devm_add_action_or_reset()
Message-ID: <20190713085237.GC103820@dtor-ws>
References: <20190708123323.11943-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708123323.11943-1-huangfq.daxian@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 08, 2019 at 08:33:23PM +0800, Fuqian Huang wrote:
> devm_add_action_or_reset() is introduced as a helper function which 
> internally calls devm_add_action(). If devm_add_action() fails 
> then it will execute the action mentioned and return the error code.
> This reduce source code size (avoid writing the action twice) 
> and reduce the likelyhood of bugs.
> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>

I'll apply parts of this as the driver should use
devm_device_add_group() for the main sysfs group.

Thanks.

-- 
Dmitry
