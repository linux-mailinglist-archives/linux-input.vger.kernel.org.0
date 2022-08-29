Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38EFC5A4EBA
	for <lists+linux-input@lfdr.de>; Mon, 29 Aug 2022 16:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiH2OBe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Aug 2022 10:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiH2OBd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Aug 2022 10:01:33 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D306D7CAA0
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 07:01:32 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id z72so6576523iof.12
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=gJda1LJQ5FD9GLY+iaphVK4mNPFhGGPUjARDrfYCJc4=;
        b=O0zjS3bO+FV8Pq8BR9FgR2E9v202xJckfTp19IbkRBTjNF71Ye9p69dPCh0zXrpTDB
         9/HFEvMHuhc3/o5WSgRQ7no3xMfvC/mE/brsqg4w+jjQiIltj0YBuXWNRuFvaEvSUDrd
         ewarG7+bTRs5umvoMTXNoPnYHWL9Y49Q+kCCessoElnVKhNgXMUBBPP8TWG34rmMjZ38
         EDYmA6uo9exizvqcBTV0rAqGFyhRpHK8nX6e14kBwGK54ARP726B0RlJsnKdImteRhyU
         QJJkEPda0OUCxNPvjY0VoqyMWkCfmc1AOoMPk55d0E5aWV9n1fvLxQTQOGcUVpnrVD2X
         bDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gJda1LJQ5FD9GLY+iaphVK4mNPFhGGPUjARDrfYCJc4=;
        b=WXfWU8axa7PiWLXmRpk6aTCsvnBHUrEfFI4OzUOFBFjv6PI/vIEvwXmaSG5+ZwsYhc
         4ATQ5+CZ59gLDFOuZrp14yjdRIvsYhic7CYvMQqT3yecg+FEmU5iN8JNPfLTNmadis/8
         FPTO8ERZ6Ntp/IuDVNU8X2l7fnmEXnSVoP3v2QIWSHHvMhyDftMsFHpjLV5PUYEYYaNi
         CKZFTBjZ2sYtGNHXx/p6JVPJm29xJ1jSsb3BLpW8bnYvU2O4npFmdI+oSkqphNNWtCeb
         ENM/l1NIoUpfaTlA0N3s1eX6LAVfI4uq/+b1pnaU+Hgnkp2Tk5Vnnxqq5XKiNDI9QvSX
         hSmg==
X-Gm-Message-State: ACgBeo3d3lBT2ZMgDf4VCGzefE4hYPtuopKOeBv9bejrGUOPFFZR1VkF
        NAqtrN1MT2nPkR5LB8KKAkg=
X-Google-Smtp-Source: AA6agR4IX4g2CQXdikQICczm1MUaiIZymEHzy0SuevKT7gVzqS1mSbPG3vFomRxHf0xUnoRB+rJ1Ow==
X-Received: by 2002:a6b:610c:0:b0:688:820d:bd14 with SMTP id v12-20020a6b610c000000b00688820dbd14mr8368121iob.205.1661781692191;
        Mon, 29 Aug 2022 07:01:32 -0700 (PDT)
Received: from [192.168.0.27] ([204.237.49.50])
        by smtp.gmail.com with ESMTPSA id o34-20020a027422000000b00349d0b0b67dsm4296583jac.120.2022.08.29.07.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 07:01:31 -0700 (PDT)
Message-ID: <cf42d586-ba25-6c0c-eb59-a5301339db6c@gmail.com>
Date:   Mon, 29 Aug 2022 10:01:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] HID: logitech-hidpp: Enable HID++ for all the Logitech
 Bluetooth devices
Content-Language: en-US
To:     Bastien Nocera <hadess@hadess.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Cc:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <4542beb149883ab5dfdcfd7f6bb4b516e5c1bcdb.camel@hadess.net>
 <CAE7qMrrj+rBzoAFf2FezqexgWNo+iSAd6b5NZwKFQ1C1zD_Qaw@mail.gmail.com>
 <f285873c4cf0a0747db996bbca7e7d9234ce77fb.camel@gmail.com>
 <1c34957f0963138f8269d0839aca174a44e93276.camel@hadess.net>
From:   "Peter F. Patel-Schneider" <pfpschneider@gmail.com>
In-Reply-To: <1c34957f0963138f8269d0839aca174a44e93276.camel@hadess.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Only partial documentation and I can't distribute it.


peter


On 8/29/22 09:45, Bastien Nocera wrote:
> On Thu, 2022-08-25 at 16:47 -0400, Peter F. Patel-Schneider wrote:
>> PS: There is another HID++ 2.0 feature that reports battery
>> information, 0x1F20 ADC Measurement, but that is not in the driver
>> code.
> Do you have documentation for this one?
