Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4E774DD96
	for <lists+linux-input@lfdr.de>; Mon, 10 Jul 2023 20:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjGJSvO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jul 2023 14:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbjGJSvN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jul 2023 14:51:13 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC6ECA
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 11:51:12 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b89d47ffb6so23747995ad.2
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 11:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689015072; x=1691607072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=92bWY9OfJyQmIp9sHGLknYLvxxaO0+c03mSLJzhcJlw=;
        b=DYXQwT//oA6PPFfV4E69XW3T6r6Rv3xlKNsHQQm1lrPU7l6r5Hjz6YpOAbwsT8MxuE
         yCsPUK4OJXW4snMFNJm0cVLPdfl/vrtrrJDUVWjUNHL9bElVuYNe+m0psxNEClwoOE+W
         /LpszXOvXP8m29eCm9TAGzX+ouQJ/OMr7sguGNixnuwAMNmDkHU06ZhN6/h7I4glLA40
         ewkYZ2OjCl4EAvwZDkGInLyNt6U6Ew11NN2xY1gjVNYEHOTbHJY6MtkbKfMzUQY2qlZ7
         zM9XZDFyuRxNiFssihjaJLqNUqVY3Sp1EzY7FGH/qNr15ahM4bL2pY6K5yQJ4LENpwcm
         NZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689015072; x=1691607072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92bWY9OfJyQmIp9sHGLknYLvxxaO0+c03mSLJzhcJlw=;
        b=DQghvhA4qgfP67fNvmE+zwHr7c82UfdanRXxjwseo/zW8DE5YDE73K0uaI6NWGqkjb
         xgG6+biEPedrT0yNAUPRCQWt7dDr0OxUd8QZx7gSpiA+UesuR3TFHaCT0Lj4n5AwFuKP
         ori1L+C457z6dbDffw3EZcp8I7+Y9DQWCOQYPfkpFnf9R3fOoIpQKl1OkIE6Lhhgbq9a
         4zaHp08mxO4ZiV72qAAixWwdQ0m+C4cjHzwdBV1q/yY+JA74vKqzcxB3MYU4n8sCgG+d
         ZmCU2oRKDoi7XK1Ro0LHiG3cvB62jF1dsPtXCoZLtANgTdb7Ypnptdfwps8Ne0BhU2nV
         PzmQ==
X-Gm-Message-State: ABy/qLZjMWpbhu1DVWr1mlIuNdLH2ITCVvXzUmhUrZTxbGX/VF1mVLu2
        jPGtit/1vxTrx92VxquQJumOJBRa0AY=
X-Google-Smtp-Source: APBJJlG1WOXP395qS4xfYwRJcN4LBdtZTUnR8gcyn6EbMM0lyAExavCNoV5+W11nuWh9vOGJc/jOjQ==
X-Received: by 2002:a17:902:db11:b0:1b8:9ec5:79e2 with SMTP id m17-20020a170902db1100b001b89ec579e2mr12985557plx.1.1689015071692;
        Mon, 10 Jul 2023 11:51:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:96bf:7e77:39eb:7a23])
        by smtp.gmail.com with ESMTPSA id je3-20020a170903264300b001b83e624eecsm236681plb.81.2023.07.10.11.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 11:51:11 -0700 (PDT)
Date:   Mon, 10 Jul 2023 11:51:08 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH resend 2/2] Input: novatek-nvt-ts - add touchscreen model
 number to description
Message-ID: <ZKxTHODkvASX01cM@google.com>
References: <20230710123633.323937-1-hdegoede@redhat.com>
 <20230710123633.323937-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710123633.323937-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 10, 2023 at 02:36:33PM +0200, Hans de Goede wrote:
> A phoronix forum member actual found documentation on what the model
> number for the touchscreen controller on the Acer Iconia One 7 B1-750 is.
> 
> Update the driver's description to include this.
> 
> Link: https://www.phoronix.com/forums/forum/hardware/general-hardware/1382535-10-years-later-linux-getting-a-touchscreen-driver-for-a-once-popular-tablet?p=1384707#post1384707
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
