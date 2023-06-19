Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C910734978
	for <lists+linux-input@lfdr.de>; Mon, 19 Jun 2023 02:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjFSA1w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Jun 2023 20:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjFSA1v (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Jun 2023 20:27:51 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90143E49
        for <linux-input@vger.kernel.org>; Sun, 18 Jun 2023 17:27:50 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-570002c9b38so35298777b3.1
        for <linux-input@vger.kernel.org>; Sun, 18 Jun 2023 17:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687134469; x=1689726469;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M6A4MZPR+2Vg20qYxNu7vXHygjRlVlPpY9s3RjAlFeo=;
        b=JqLislPsm2c2kqr8pHrG/rxYsz6XHaFiiV2zOSd4w1FPuI2oDVM+5Q+/re8khOH78p
         3+xcjWyAQo/lFuDaIQdGP6/7K2cbWaLXpfnEt1FzgAotrSjlKebgZ4JHnYP5n6o6V75p
         EC6sCBYRqp88Z0P+TYSxa/ff8YptSsKLraSKRKGPdtEEN5knmuKkPtXR1qFrBHfWuFOl
         HdDeXJW8/59fOx0iCte01SE0XI0WBKJMOHExHUpFrFG9fVlTw5BJP8+8AZam117zrFKY
         xS/NvRZCzsRoEklbkKJhHqqDQJHd1gar9vyfPi3/yGcKV60l5tIYNiwLzTh871nflvlC
         N/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687134469; x=1689726469;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M6A4MZPR+2Vg20qYxNu7vXHygjRlVlPpY9s3RjAlFeo=;
        b=Bl1Yq3la3Dg9qCk29HA/uF/MQkh7Rgo7zDCpubCrMnQpNy07Z08pGnk34mqf7RTaoS
         RSET3MSzNCKHTGPDms54EtSTEdK7AzAfu9JcY6b0+eliB4Mfx+c4oYz9fFCg8l2UemM1
         mcxAbZa5m+GEVfHI3zpIOrJRNsuncd3SPzGGxPKj0s3uZoJLC6Y1Bz40+JJ95ltWccpw
         asD+QZg48OsHvoFdHy4RXyZyB2wcKvWO59H2GoeqP3nEufDhdFZpIAlloutx7zb2w/RX
         US6Sn7iVDw9GYd1cFKkZhpZbqjY8WFg514oAheMPnWXDlaaBkR6WrlXMeVSOWikBbVi3
         DTfw==
X-Gm-Message-State: AC+VfDzlWfSE3qAMBMop5mSmFCRSQBIOQRqDED0QcNkkCRT3fIf5sQBp
        FbhOV4IuSofJGvycUOWyAmNPeFDjiORUaJpVhwSPYnBUZqk=
X-Google-Smtp-Source: ACHHUZ6u7PxmDkUCc7j9TkAiCEwJM5a2kHBAApXEXt/w4wEaarOFZpSbyP9XxmZCYF5ZShC7COFIg6lDypeyExKEAX4=
X-Received: by 2002:a25:2d23:0:b0:ba9:9c10:cc36 with SMTP id
 t35-20020a252d23000000b00ba99c10cc36mr5435576ybt.4.1687134469239; Sun, 18 Jun
 2023 17:27:49 -0700 (PDT)
MIME-Version: 1.0
From:   Xiaofan Chen <xiaofanc@gmail.com>
Date:   Mon, 19 Jun 2023 08:27:38 +0800
Message-ID: <CAGjSPUA1A0RVrf1OmgUKL3prOBuNFvhPJXJ4n7YbKrPLZb5h9A@mail.gmail.com>
Subject: Clarification about the hidraw documentation on HIDIOCGFEATURE
To:     linux-input@vger.kernel.org
Cc:     Ihor Dutchak <ihor.youw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Current documentation
https://docs.kernel.org/hid/hidraw.html
+++++++++++++++++++++++++++++++++++++++++++++++++++++
HIDIOCGFEATURE(len):

Get a Feature Report

This ioctl will request a feature report from the device using the
control endpoint. The first byte
of the supplied buffer should be set to the report number of the
requested report. For devices
which do not use numbered reports, set the first byte to 0. The
returned report buffer will contain
the report number in the first byte, followed by the report data read
from the device. For devices
which do not use numbered reports, the report data will begin at the
first byte of the returned buffer.
++++++++++++++++++++++++++++++++++++++++++++++++++++++

I have doubts about the last sentence. It seems to me that for
devices which do not use
numbered reports, the first byte will be 0 and the report data begins
in the second byte.

This is based on testing results using hidapi and hidapitester, which
use the ioctl.
int HID_API_EXPORT hid_get_feature_report(hid_device *dev, unsigned
char *data, size_t length)
{
    int res;

    register_device_error(dev, NULL);

    res = ioctl(dev->device_handle, HIDIOCGFEATURE(length), data);
    if (res < 0)
         register_device_error_format(dev, "ioctl (GFEATURE): %s",
strerror(errno));

    return res;
}

Reference discussion:
https://github.com/libusb/hidapi/issues/589

Test device is Jan Axelson's generic HID example which I have tested using
libusb and hidapi across platforms as well as using Windows HID API.
So I believe
the FW is good.
http://janaxelson.com/hidpage.htm#MyExampleCode (USB PIC MCU)


-- 
Xiaofan
