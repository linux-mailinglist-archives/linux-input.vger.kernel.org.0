Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579193437C6
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 05:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhCVEEm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 00:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhCVEEg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 00:04:36 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCCE9C061574;
        Sun, 21 Mar 2021 21:04:35 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id q11so5851769pld.11;
        Sun, 21 Mar 2021 21:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qdg7iYdSNQO8uEY6efY/Pqdgrk+j03I5AIBBU9c+4U0=;
        b=a+iJmmKHODNpE9pbQ90RF5BNGlf1qTRbNWlYtpCZHwOJsXC12Sp047G/cNGyZRq3vy
         aA1vFqENpVjnOWUnXR5G5Q+vImwk02P0cq09+mQfwEsDbV+rs58VVaB98SMOwczVYsum
         6Bd61m/bzf57rGpFGBswjGHGF4aB08ncmCSCcVty6fsBuy4yxo/9xdpxTnvDMGNi2Jww
         oIk8dfLawO2zLKwRCUl/iNWDzUCGSNh819RPReeomwIh5aKdp7tUMmVWTKI6FUrI44Tc
         MQPc6TKksQtdX0hBkfYEHXxLAHiedjNleaCEj1RH0QbSLl5n3gWl2+rkaKOyIDa6zth3
         3BNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qdg7iYdSNQO8uEY6efY/Pqdgrk+j03I5AIBBU9c+4U0=;
        b=Lb7muXOhz+iT/zIewxCPK7tjkTeDjOqCetqtbcWJptqDFdkpuYPp5ueW7GpqundPgj
         I8EQYqxjfkpAL45lyE2MVU/0ASQj9NU/w8eoZ3FOB6uD64T2yRUbOkENjUaXDXOv/TpN
         /d3lSGSd3vXiBbdmht4U+FtHGg7EMmqzqqAsqNYg6Yjvjh2imdRRbq+qwv1592yupsXa
         MQmQE3ebJPG30W+CVJWajzLiBep+osUZMjaEucJ+1nzQN05wlqlXPC9evpgzwsxqsDBK
         q3mBaofX6wF91eg1e2AVXDVOp0GYt/+/Z2d9YBRMgsnO4HeNkwL7f0MUhGJuR9nCHte2
         i1Kw==
X-Gm-Message-State: AOAM531ZHaqvouzcCbTFSz3RT3x+dy5L2ektNelp8gbCve9A77XQPHWC
        O/VenYwmSb6H2ytRbUIFXeyN53i/WRw=
X-Google-Smtp-Source: ABdhPJyPkMZgEgpVv+I4jrssdzPWHVNlWhQem1le80xfVOjQsKmT3SqeGpbCIJHY8AGJgdikCipKSg==
X-Received: by 2002:a17:90a:c004:: with SMTP id p4mr11110618pjt.202.1616385875347;
        Sun, 21 Mar 2021 21:04:35 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id ds3sm11995656pjb.23.2021.03.21.21.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 21:04:34 -0700 (PDT)
Date:   Sun, 21 Mar 2021 21:04:32 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/9] Input: iqs5xx - close bootloader using hardware
 reset
Message-ID: <YFgXUAlYlEwWK2Ea@google.com>
References: <20210313191236.4366-1-jeff@labundy.com>
 <20210313191236.4366-6-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313191236.4366-6-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 13, 2021 at 01:12:32PM -0600, Jeff LaBundy wrote:
> The bootloader can be closed using the 'execute' command (0x02) or
> hardware reset. Rather than using the former option for successful
> firmware update procedures and reserving the latter for recovering
> the device upon failure, simply use hardware reset for all cases.
> 
> The post-bootloader initialization delay increases marginally when
> triggered by a hardware reset, so increase the wait time to ensure
> the device does not subsequently fail to respond.
> 
> As part of this change, refactor the return path to avoid an extra
> assignment and to make the logic a bit smaller.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
