Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E034361209A
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 07:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiJ2Fnd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 01:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiJ2Fnd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 01:43:33 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D0F88A29;
        Fri, 28 Oct 2022 22:43:27 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id b11so6329738pjp.2;
        Fri, 28 Oct 2022 22:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eSxGW8VSXQH29RP+qVcRowt10gdA6+owThqJVu58aP8=;
        b=MJ1lbV+gZIxzdqhPJmls3u6JEH5Ibfij83W5hBaN09H0062OgR0C3lLN3UTy2SdVar
         uKsDgAz3XXDAqYV7AefDYymhiBm0fOusiEwtFql4hnta49hLaOc55nR6VAWF0oYJi5/i
         RTNYLAWj364zZiVGg4qPHaH97F0SrOlpJChnghpu7huVZnF4rV3RiS22VW1yQu6g0QAu
         W69ZwsY8TJqaP+Lyye48hQVGPOz3f9YXSRDoR2D/uIIxkT9gvq6qYRaWWqP74HlbzHOA
         2RVgyuecFiRojT65jWWL3uizhHviOwYbzbFtG7k37FQ9GFVnleb62u1qGtCf3nTzVNVy
         Akfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSxGW8VSXQH29RP+qVcRowt10gdA6+owThqJVu58aP8=;
        b=rPQZpbyUmIJFfO3as1pX92lRzNoHSIYBY2n2HYTHpAhBmWDZq1EzUceHNucdYJmlk4
         uRRsXJcb4IZpQVxut8t44Ep39tE4aj/qsW9gSWAKTmrplVYnrkP4mLyCIPKKbC9ZR0cZ
         mc5lVXLMH5dKPxf5OBzY4nyGQ2KDHn/gvllvhIQHfqNeQmZ8PEDeV9NhLAkgPUcMep5t
         AgvsbNZYrrskH9q8lGN2m0CTUEESrLL/8sFnsfA00LZkhMMuxmnlusxh3T2DSQp2MI5y
         eg+lNQ2aHo8j8Gguo61GrBWe6tNAncSIj7iys+eilj93eVCmX6bgGM1XOaYW/GoG/dV9
         QWNw==
X-Gm-Message-State: ACrzQf1YW2AfYn+EKiZmKeIU5RpGwqosKciqaF1U9j1TtEr0Av27DlSB
        BHJrHar041FgQeku0S4TcW8=
X-Google-Smtp-Source: AMsMyM4F8ZoqOQ9FYOTuyLnCKddf3Cju8GMoEOm+DqVHyR8IpufXOmB69wKM8+rpBOEu1VBxGRnXhg==
X-Received: by 2002:a17:90a:6045:b0:212:fe9a:5792 with SMTP id h5-20020a17090a604500b00212fe9a5792mr19630896pjm.178.1667022206914;
        Fri, 28 Oct 2022 22:43:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2acc:9d2e:bff9:e77])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090a414c00b002135fdfa995sm344652pjg.25.2022.10.28.22.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 22:43:26 -0700 (PDT)
Date:   Fri, 28 Oct 2022 22:43:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chris Morgan <macromorgan@hotmail.com>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        mkorpershoek@baylibre.com
Subject: Re: [PATCH V4 3/3] input/touchscreen: Add Hynitron cstxxx touchscreen
Message-ID: <Y1y9e9sgE/Dck9fB@google.com>
References: <20221028202636.14341-1-macroalpha82@gmail.com>
 <20221028202636.14341-4-macroalpha82@gmail.com>
 <Y1xGIykG5H5QmtZa@google.com>
 <SN6PR06MB5342E823C4FF82E974724AF3A5329@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR06MB5342E823C4FF82E974724AF3A5329@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 28, 2022 at 04:43:16PM -0500, Chris Morgan wrote:
> On Fri, Oct 28, 2022 at 02:14:11PM -0700, Dmitry Torokhov wrote:
> > Hi Chris,
> > 
> > On Fri, Oct 28, 2022 at 03:26:36PM -0500, Chris Morgan wrote:
> > > +static void hyn_reset_proc(struct i2c_client *client, int delay)
> > > +{
> > > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> > > +
> > > +	gpiod_set_value_cansleep(ts_data->reset_gpio, 1);
> > > +	mdelay(20);
> > > +	gpiod_set_value_cansleep(ts_data->reset_gpio, 0);
> > > +	if (delay)
> > > +		mdelay(delay);
> > 
> > Just wanted to ask - you do not really want to spin for 20+ msecs here,
> > right? I think changing mdelay() to msleep()/usleep() should be OK
> > throughout the driver...
> 
> I just tested changing all instances of mdelay to msleep and msleep works
> just fine. Do you want me to resubmit or can you change that as well?

No need. I made a few additional changes and applied. Please take a look
in my 'next' branch and yell if something is wrong.

Thanks.

-- 
Dmitry
