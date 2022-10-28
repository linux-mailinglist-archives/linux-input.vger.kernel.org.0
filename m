Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69DC3611C47
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 23:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiJ1VOR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 17:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ1VOQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 17:14:16 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF34B1DC805;
        Fri, 28 Oct 2022 14:14:15 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id m2so5681182pjr.3;
        Fri, 28 Oct 2022 14:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XSX22hEo7Bk5uNMDxoObHkiDVmcaHBQcaAl5AnzXJYk=;
        b=d4XKZFOgIWxXtvtzDfHfBKZc5CBziQyIgukyG293xwuRJjY0FJhP7Vz53r+7fchp6A
         hohnX/IOhjs+SS/Q9kVN6jqUbVuElPCmNmG/l/CE/bymD3o+RdDuIVs2nUyJJf4LacGk
         32877EAPo52w4QiSSafUmcPBs3azJGDQD6KF4figjcBNhZtR0hV1aWsgVAxb8Hp2GKzr
         Y0e7aQF9HH7eaavfxSGyXlCGDzPvZhAWZx03EJ7fCA1KfwrlKWBnuUi8PPzH0zrl4iZp
         6g2XSwEqk37MDMDlqPxkUC2fZKuMDh7+uuD6E77MxMPmPAcGdv+I1UhczUSQY/ynlqDI
         LlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSX22hEo7Bk5uNMDxoObHkiDVmcaHBQcaAl5AnzXJYk=;
        b=DPzcXMitmx8AbKcM8jBWMwEFB+6wmLPvKEHG92OVzQyGhACkbMlEC0+DX1OzXuw5NS
         m10GhB6NWYM9im/AO0EAsCjctViyhR63Rchb2pKlZh6I21ssRDU1oxlLkM0/FOhrk11F
         hP5nII4LGCkZx8BviE9nR9bOWbDir9julHEzE8VUhmDOYcRr6BObITnQbaB3/PE5O/7K
         eSEnrWK5XcqsdLvu0DZKK5MAGVW3OPPapYF/VgTodBswloQVOgvklNEO32BGWP6/xhSJ
         11bMUUnGG4BEtlGyFSuZvbZN2Yrig036AzaLYu7IcFcRXqzEyshfj54bQJeX65v0QKlY
         nkKA==
X-Gm-Message-State: ACrzQf2kCVCwn0lWoXwioRcjtcd3uNPxW/6sTYvlJRzKNTB0Xoakdc+B
        kZAr9i6g82YZ0eoSXJ0wJEM=
X-Google-Smtp-Source: AMsMyM5wJAgNy5QmwkAXR+3nxRVCPAsYPnQbQ/FQIEr3WaL3feKwyiozYOA/8TWy4K5Qocp9WjhcqQ==
X-Received: by 2002:a17:902:dacf:b0:186:a397:3257 with SMTP id q15-20020a170902dacf00b00186a3973257mr1008238plx.100.1666991655198;
        Fri, 28 Oct 2022 14:14:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2acc:9d2e:bff9:e77])
        by smtp.gmail.com with ESMTPSA id a22-20020aa795b6000000b0056bb06ce1cfsm3358345pfk.97.2022.10.28.14.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 14:14:14 -0700 (PDT)
Date:   Fri, 28 Oct 2022 14:14:11 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chris Morgan <macroalpha82@gmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        rydberg@bitmath.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, mkorpershoek@baylibre.com,
        Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V4 3/3] input/touchscreen: Add Hynitron cstxxx touchscreen
Message-ID: <Y1xGIykG5H5QmtZa@google.com>
References: <20221028202636.14341-1-macroalpha82@gmail.com>
 <20221028202636.14341-4-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028202636.14341-4-macroalpha82@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Chris,

On Fri, Oct 28, 2022 at 03:26:36PM -0500, Chris Morgan wrote:
> +static void hyn_reset_proc(struct i2c_client *client, int delay)
> +{
> +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> +
> +	gpiod_set_value_cansleep(ts_data->reset_gpio, 1);
> +	mdelay(20);
> +	gpiod_set_value_cansleep(ts_data->reset_gpio, 0);
> +	if (delay)
> +		mdelay(delay);

Just wanted to ask - you do not really want to spin for 20+ msecs here,
right? I think changing mdelay() to msleep()/usleep() should be OK
throughout the driver...

Thanks.

-- 
Dmitry
