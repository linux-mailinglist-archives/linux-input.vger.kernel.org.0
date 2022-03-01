Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C31234C849E
	for <lists+linux-input@lfdr.de>; Tue,  1 Mar 2022 08:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232841AbiCAHEz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Mar 2022 02:04:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232395AbiCAHEy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Mar 2022 02:04:54 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55294673CC
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 23:03:57 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id v4so13311303pjh.2
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 23:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ASS4w0yEzcUUAzzXSqG0ryTJvC6jE49DU9Jx2XK21IA=;
        b=MvwVnpVMVKTo7h+TFYzcg6cdOqBAapj7gW5yhDY39SPdyxNaPIPBRq9DO6JR2iLaHi
         yZ5xWL01Ieq1bTyK8RC3HxQjUnuQnvLAtL6AaoyZhC4bhYxBgwrIGIYzYAof/v3hu5z6
         pYqnkkKtQGUFXnogF/YMlZNSWicO72bwVoQ9ZF+J2lukhJ+GaeEJ0vKusuA5TCIZTcML
         g2jHIMeiAneKD845KEHXmY/ghZPH/q5Lb1PS+Q+758r49rz0K1z7bBpbC/6kVbAjPkva
         bwZHO8tEM21wDESRJcw5QJ7Dvs/S2mAQZO4KcNe961SCov3F1EcLN6ctuiWROmaMQZUV
         fIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ASS4w0yEzcUUAzzXSqG0ryTJvC6jE49DU9Jx2XK21IA=;
        b=MXN0RP2TRdiEQaaFRh8kXOuBYqOQj281v/Woz0/v4oWlBuYAmscWB6/8g8x0ZgPIJl
         Q71tJ1HnlN7apZJtGiB3MNsF5HdOxaveeb6Je2Rfd9l3BWiktXiqAGejp+UWA6n1mi/n
         0Sw3E5EZiq9oLw5fvyJPR9DM9uxrImmw461+DSgx7pjpm3v3S8ZsCcGDFbqrrVtQx2D6
         HXNVrJM0XkbmTH5yFCOLXloztagtwnkaxVqmC2Ktpo9TLHBNfz9N9KA5QpHXzm7H+6l7
         RA8EKgcwuiJ+Aic8nOMj7XQ2xyPmiWigc+YNpWOM+IxB8+hY3oj7SYZYS8dDgAPtb627
         9Jog==
X-Gm-Message-State: AOAM532tsk0msXeZdtSPO5bZvxi8wwwQcskZAQ/XT3gdT+vtOe7cbwgV
        0tKOzCbsrjHjno0EJI+pSb4=
X-Google-Smtp-Source: ABdhPJzMxBhLXl3MwDPGCaYkv6gF08FQMKUMapamcy7lUkS/Gb7RSCNHovTdHzp1sAFodeVBKPfLXw==
X-Received: by 2002:a17:902:c944:b0:151:3829:a917 with SMTP id i4-20020a170902c94400b001513829a917mr18780209pla.144.1646118236726;
        Mon, 28 Feb 2022 23:03:56 -0800 (PST)
Received: from google.com ([2620:15c:202:201:c174:264:5e49:f2cb])
        by smtp.gmail.com with ESMTPSA id u12-20020a17090ae00c00b001bc46eae696sm1179699pjy.32.2022.02.28.23.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 23:03:56 -0800 (PST)
Date:   Mon, 28 Feb 2022 23:03:53 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/5] Input: Add input_copy_abs() function
Message-ID: <Yh3FWZiJYa9DYpS8@google.com>
References: <20220131143539.109142-1-hdegoede@redhat.com>
 <20220131143539.109142-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131143539.109142-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 31, 2022 at 03:35:36PM +0100, Hans de Goede wrote:
> Add a new helper function to copy absinfo from one input_dev to
> another input_dev.
> 
> This is useful to e.g. setup a pen/stylus input-device for combined
> touchscreen/pen hardware where the pen uses the same coordinates as
> the touchscreen.
> 
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
