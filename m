Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0940531DFF
	for <lists+linux-input@lfdr.de>; Mon, 23 May 2022 23:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbiEWVjF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 May 2022 17:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbiEWVjD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 May 2022 17:39:03 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BFA65D5F1
        for <linux-input@vger.kernel.org>; Mon, 23 May 2022 14:39:00 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id q18so14217512pln.12
        for <linux-input@vger.kernel.org>; Mon, 23 May 2022 14:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gf8EhzMTzr6R8xHXhTvUK8RjrOMiGCSQG1OHTThnQ0Q=;
        b=bf5J13mJD4dQWnnlunn4dkiB+SvrNEkxLmN7hsitbi1+sQ55wql6aGhh7PEww6h+8A
         wtHA3RnQngev5DD/+DUjeEXPLDxn170USEcWZHn7mJnsaLrn5nNuOIqtvO1lgb0gAeph
         v7f4FQAT58Ig5COAqyJTjFvmE7ZktxicgKOHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gf8EhzMTzr6R8xHXhTvUK8RjrOMiGCSQG1OHTThnQ0Q=;
        b=lCSwjBPaDnCMqvZGG72dCLRKVshLgvewjFZIQmKjNRhT1bYcSIEoQg+G/YCOXwSd86
         SBtlVnClgUoIK/4Eu99pyCsTUC2UeMvtSsVTFR/0ZdtkMmJGI+DSiDTdVmJEGSWtGFDu
         VNCFEbcAN9hggBpAhkMSunV5yzLeHdUzPrVPQkfqtONAgaGH+ZgDZ8BR9BaDsbm+LAn8
         ynLTNPPdQj7Lr/CJv/UjaYficA66dDAwzJ9yfW7/SHPp8E/1fwQzCOAFqtHNrXIgEdNm
         xS7P6Lkhh4kkcIIdr8pOTWhpPdRrDMhkduGCS5gwwia2bsW7o6MsGPbkM8JgJL7bmyWt
         sCYw==
X-Gm-Message-State: AOAM532uIcWkChIi4CQcFu2Lkrf56WtQ5F2JZsgVFw7rX0AcL9PYUOZO
        0KDelkJG+oKCQG5s5/SdkyaD6A==
X-Google-Smtp-Source: ABdhPJyypJ8MhqaHRuyTJETDOVjTN0+TC0VHaKHFVnlL4gugK6qSzB6i87qOGesoOy/hnm6MTNkYBA==
X-Received: by 2002:a17:902:ce8d:b0:161:761f:6999 with SMTP id f13-20020a170902ce8d00b00161761f6999mr24171527plg.125.1653341939959;
        Mon, 23 May 2022 14:38:59 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:d9e2:8472:9ac:8532])
        by smtp.gmail.com with UTF8SMTPSA id d66-20020a621d45000000b005182fd977e4sm7706768pfd.108.2022.05.23.14.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 14:38:59 -0700 (PDT)
Date:   Mon, 23 May 2022 14:38:58 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        swboyd@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] HID: i2c-hid: elan: Add support for Elan eKTH6915
 i2c-hid touchscreens
Message-ID: <Yov+8u5Ohrzynlx9@google.com>
References: <20220523142257.v2.1.Iedc61f9ef220a89af6a031200a7850a27a440134@changeid>
 <20220523142257.v2.2.I2d3f735a485157eeaa24d60be8a327f98101789d@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220523142257.v2.2.I2d3f735a485157eeaa24d60be8a327f98101789d@changeid>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 23, 2022 at 02:23:24PM -0700, Douglas Anderson wrote:
> Like many i2c-hid touchscreen controllers, the Elan eKTH6915 has a
> reset GPIO hooked up to it. According to the datasheet, the way we're
> supposed to turn the touchscreen on is:
> 
> 1. Turn on the 3.3V supply.
> 2. Turn on the IO supply. It's OK if this is hardwired to the 3.3V
>    supply, but if it's not then it must be turned on _after_ the 3.3V
>    supply.
> 3. Wait >= 1 ms.
> 4. Deassert the reset GPIO (reset GPIO is active low, so there would
>    be a leakage path if this was deasserted _before_ the IO supply).
> 5. Wait 300 ms.
> 
> Much of the above can be handled by the generic i2c-hid-of driver, but
> the "reset" GPIO is not supported by that driver. Thus we'll do the
> same as we did for Goodix and add a new tiny driver that uses the
> i2c-hid core.
> 
> NOTE: support for this new touchscreen could theorically fit into the
> Goodix driver. I've made it a separate driver because the Elan driver
> supports _two_ regulators and it's unclear exactly how that would fit
> in with commit 18eeef46d359 ("HID: i2c-hid: goodix: Tie the reset line
> to true state of the regulator").
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
