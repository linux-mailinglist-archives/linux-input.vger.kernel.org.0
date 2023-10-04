Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D86097B8B2E
	for <lists+linux-input@lfdr.de>; Wed,  4 Oct 2023 20:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244593AbjJDSrw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Oct 2023 14:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244601AbjJDSrw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Oct 2023 14:47:52 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0A8F0
        for <linux-input@vger.kernel.org>; Wed,  4 Oct 2023 11:47:46 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-690bd59322dso91872b3a.3
        for <linux-input@vger.kernel.org>; Wed, 04 Oct 2023 11:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696445265; x=1697050065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ekpvseGuK4E7ASaMOZteciHUpOShVKJfJMNnl7vdPIA=;
        b=CKMcsrtNBdZkuna89iNDvS7CWXhFkkQlCJzRO5RF+QGzVJ4HW/QJLYrVKTAczpI+dB
         PR7mgIsfmtpApv075k2sQ7MDHin8De8NBi/FXRYDNnztWz0xVCEtjyfq9STfnVHS7SCL
         OL3eCwUFHoLwBRI+A+1fEGnRI6yhMJBeo1QyTpO6aPKuNgJHizlhBYpB/qcfjX6EzigC
         7kxJVfgsTl9d2Y7mpTysT/iYA7WjFI1OdYbTCJEXpGvCeFdrvNeDHT9y+Tu/pjxt1QOf
         xe0Ky9qwudcy1JCG/tBesMhFUAoJ4Oc0i9qWWCwiuBZcqrmZgE2t5S5dulZnNCBb5HQg
         cENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696445265; x=1697050065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekpvseGuK4E7ASaMOZteciHUpOShVKJfJMNnl7vdPIA=;
        b=NOB3jY6EO2cxrf3RX1iRtmaUIWFn10y4KLbqUcYR3OFz10zdZD7Gp53o3hsbRlq8we
         08aetC1HEKpL8VAxZIMwMD96NX202rt+yUApXPZcQ1JYsCxL//lw1fFxx4dMq0+Udw1i
         +u/E8KXJyKHCesi4ZKTQOMWvKXIe/mYZhRJDrsO/wp0gINxnzU9zJUB+VtilieCL/wIp
         RVSpKTvcT73TOYj0r4+IemDczOGFCO5dg5h3JjCcpyKcMt/YWDWFsQhtUNdA9boz50i9
         iUss++AHOpGlsQqTVspCQrEybwEqEEqKaj6j5evrI72cLpFYRz9/Dmx9FgVzNyCBH8Dq
         uQFw==
X-Gm-Message-State: AOJu0Yy0fpaytm9LBZOMM8f2hiH6KMUmA7mQgsjT18+dRJRAXb2awP5A
        iUGWOV9yi8TlXDuhEYyQYhw=
X-Google-Smtp-Source: AGHT+IFONmtbV9D+qu4SdYXIN5B2KECt8psHxBelfzCWHHRWSRVoB5X1MRK3a9yIgdc1UtEUHEMtUA==
X-Received: by 2002:a05:6a20:5490:b0:13d:8876:4c97 with SMTP id i16-20020a056a20549000b0013d88764c97mr3692843pzk.16.1696445265576;
        Wed, 04 Oct 2023 11:47:45 -0700 (PDT)
Received: from [10.10.13.50] ([104.129.198.116])
        by smtp.gmail.com with ESMTPSA id j8-20020a170902da8800b001bb9bc8d232sm4055052plx.61.2023.10.04.11.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 11:47:44 -0700 (PDT)
Message-ID: <0d4936cf-578b-4cbb-aaf7-f8ff00695000@gmail.com>
Date:   Wed, 4 Oct 2023 11:47:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] Input: xpad - Add HyperX Clutch Gladiate Support
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     maxwell.nguyen@hp.com, chris.toledanes@hp.com, carl.ng@hp.com,
        linux-input@vger.kernel.org
References: <ZQTEZEdd7xwHz9CN@google.com>
 <20230916014452.5241-1-hphyperxdev@gmail.com> <ZQfgV76yld8XGtG9@google.com>
From:   "Nguyen, Max" <hphyperxdev@gmail.com>
In-Reply-To: <ZQfgV76yld8XGtG9@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 9/17/2023 10:29 PM, Dmitry Torokhov wrote:
> On Fri, Sep 15, 2023 at 06:44:52PM -0700, HP Dev wrote:
>> Hi Dmitry,
>> That should be ok.  Thanks again for your support.
> Great, applied, thank you.

Hi Dmitry,

What's the typical process for the patch to merge to the main branch 
once it is applied?  Just curious for future reference.

Also, should I reference this link for the latest?
https://github.com/torvalds/linux/blob/master/drivers/input/joystick/xpad.c

Regards, Max

