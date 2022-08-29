Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26FB25A544B
	for <lists+linux-input@lfdr.de>; Mon, 29 Aug 2022 21:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiH2TIC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Aug 2022 15:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiH2TIB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Aug 2022 15:08:01 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEC57A776
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 12:08:00 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 73so179657pga.1
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 12:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=i5bKUTrb+rmLcQzkpU6se5oAMu2l3FKdPS9MD2hRt6U=;
        b=RDDWcuxD4oVbcRzclcJ3cIjOiFkzBfoPFqyO6YmocITJZOvLBBXwnecQ2zt5T9KBvK
         u12Q/lMA/BI6O6z/05quk4e3nBwfsbDStLt+SQT00tLIhzK2jLQqjMlY2cO04MMMF+8n
         c35Eu4b2p1XAMo9iLwWVR02ug67GlkTzHQntJVczws3EpasGJ3qxVHWaps0fvRT1r+mq
         K472D+bcAkNsbkmSWFqMbc+GttrC5qc8Fd4EnVSfjspVVeX+vz8RITPy3er+uhsiY5k5
         oRFNI/jIkofCq9cTg281IXqLkcW4de67fNEk75F1ylPRoMS1xBkpD4+a2rBIkEmvxeWp
         TTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=i5bKUTrb+rmLcQzkpU6se5oAMu2l3FKdPS9MD2hRt6U=;
        b=PW/QaDF4lt5aACkMldeFMJL2LnD2FL13kFriFy09eZeSKk9wrLwVqmfkBVReBQxZBK
         qONTXFWVpbbXhaKdwfOsieZ/Nk+bA34TO2ZCjHbn9yQq9S8bnRjMg+48danN/4qdbgQe
         3mGFugMOkHXzMVcuXwiXfYVjKByGvO3v1MNr9gQcShmD+G61Nz6NZr9uvffrO2MKMrZz
         rZdms2INtFxrnm/00k0xtwaWDmd6QDtnbYDJ4qPhclVTaM+iBB8tu+7ikDronFagZebg
         5eEV5FjmiuAJogMvWTic74Q6C6J3mmxLW7XinU7eHPU1nW4u9hlsS9JhG2B4xNycCAbC
         vGRA==
X-Gm-Message-State: ACgBeo1TBdycfdWy91qiwEpNPWLhBMG4X4ap9jQVEE5FFWnFpbWV7/FS
        l56gqz0mmHzmZb2lOxVpMLdp0w==
X-Google-Smtp-Source: AA6agR7VCq9o9rb31ziklMeuW2vIyE5vZINyv1AAur7Edf5GqfjCFc0T8IR6q1spIj+JCT30jBg71A==
X-Received: by 2002:a63:395:0:b0:42b:80a2:7ad2 with SMTP id 143-20020a630395000000b0042b80a27ad2mr13042872pgd.194.1661800080287;
        Mon, 29 Aug 2022 12:08:00 -0700 (PDT)
Received: from ghaven-kernel ([2601:600:8f80:973::5f])
        by smtp.gmail.com with ESMTPSA id 201-20020a6217d2000000b0052d50e14f1dsm7563069pfx.78.2022.08.29.12.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 12:07:59 -0700 (PDT)
Date:   Mon, 29 Aug 2022 12:07:58 -0700
From:   Nate Yocom <nate@yocom.org>
To:     Bastien Nocera <hadess@hadess.net>, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH v5 2/4] Input: joystick: xpad: Add ABS_PROFILE axis value
 to uapi
Message-ID: <Yw0OjoVzKV3QOYah@ghaven-kernel>
References: <20220825222420.6833-1-nate@yocom.org>
 <20220825222420.6833-3-nate@yocom.org>
 <3e48ef8d13337ce1c3ec68baffc612fde4740b0e.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e48ef8d13337ce1c3ec68baffc612fde4740b0e.camel@hadess.net>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Aug 27, 2022 at 12:40:46PM +0200, Bastien Nocera wrote:
> On Thu, 2022-08-25 at 15:24 -0700, Nate Yocom wrote:
> > Add an ABS_PROFILE axis for input devices which need it, e.g. X-Box
> > Adaptive Controller and X-Box Elite 2.
> > ---
> >  include/uapi/linux/input-event-codes.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/include/uapi/linux/input-event-codes.h
> > b/include/uapi/linux/input-event-codes.h
> > index dff8e7f17074..7ad931a32970 100644
> > --- a/include/uapi/linux/input-event-codes.h
> > +++ b/include/uapi/linux/input-event-codes.h
> > @@ -862,6 +862,7 @@
> >  #define ABS_TOOL_WIDTH         0x1c
> >  
> >  #define ABS_VOLUME             0x20
> > +#define ABS_PROFILE            0x21
> >  
> >  #define ABS_MISC               0x28
> >  
> 
> 
> You probably also want to add it to the absolutes array in
> drivers/hid/hid-debug.c.

doh, roger.

> Again, you might want to wait for confirmation from Dmitry that this is
> the right way to do this for the profiles.

Makes sense.  Dmitry?

