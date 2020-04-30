Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 387BF1C093C
	for <lists+linux-input@lfdr.de>; Thu, 30 Apr 2020 23:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgD3V2L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Apr 2020 17:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726463AbgD3V2K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Apr 2020 17:28:10 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C85BC035494
        for <linux-input@vger.kernel.org>; Thu, 30 Apr 2020 14:28:09 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l19so877265lje.10
        for <linux-input@vger.kernel.org>; Thu, 30 Apr 2020 14:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=precisionplanting.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=a+jDmzQNzQlddinr4Vlkqz1JpfQaqjvfD1e8sIn3vtw=;
        b=bKr6HFVhe/al+AnA6C3lDy12+srmUNNUAvKltRYZRdAaofwfyA9KirLdSdo1fiWtT3
         Ssc1KVe4DH25YLZGffxfOYWlsy8DClWHei3WkYAExkieRlqNQBpcc/Qa+hOIYH8BdVqC
         WV6Rz3la6T34mgIojin2gFXFsMeexokw9y8nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=a+jDmzQNzQlddinr4Vlkqz1JpfQaqjvfD1e8sIn3vtw=;
        b=XA3ir42AJKbsgxlOKVhB8PT/IYPrZ30+SCIfk5MADlbLNd6IFWdzWaZqh3wTq0Nn7i
         MNMtByNPiuJPeHj3RZw3nJ3XPIU6qVguJp8ExzRNa+t+JjaU5FCQwqK2pPaVXXpbYMy5
         kUZb16LdMH+vC6j8BgMlWfzFE5tS+xmzc8k1w3CJEm5Lp0Bk6wgHM1nqIFMqHsyiiDcB
         dt8DI+rC/oi8UdGDjGkEj/CQektM1/ofdHjaJJusIoNhXU1vuvSkHwGfxVYNnImaj+p+
         W3Kxl6Kr49Gj8uMQFghTUFiPGng8vEz5K1BHmSy5hT7x2oWBZLpgUyAERNycwwDWvQkO
         A97Q==
X-Gm-Message-State: AGi0PuabZ3qtntn/lhqCPEfSxn3efIUbenYywPmKEreidbgRnMKB+e3w
        4zwRMQTKF3lv3mdD0COfP7ffPmhDD1AXBYK+QKSk6gHtFw8=
X-Google-Smtp-Source: APiQypLg/5sUoncq/nfRw5dnKG7qolQxqu3gxwv7i1Wy9aU7AhsRBvI7LyA7/hScipvyKhq6+Hd09Z5iqUd7R5UbLks=
X-Received: by 2002:a2e:87d3:: with SMTP id v19mr495838ljj.176.1588282087305;
 Thu, 30 Apr 2020 14:28:07 -0700 (PDT)
MIME-Version: 1.0
From:   Dexter Travis <dexter.travis@precisionplanting.com>
Date:   Thu, 30 Apr 2020 16:27:56 -0500
Message-ID: <CAOyfbRVgs2TUH_PS7Ny0HEhYEycz7fRd4RG-M+wFdp2LefbxXw@mail.gmail.com>
Subject: can gpio-keys send different codes on both rising and falling edge.
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I have been able to use gpio-keys to create a key input which can
either suspend or wake my device using KEY_SLEEP and KEY_WAKEUP event
codes respectively, but not both.

I would like to use a single gpio to control this behavior.  On
falling edge the KEY_SLEEP would be emitted and the system would
suspend.  On the rising edge the KEY_WAKEUP would be emitted and the
system would resume.

Does a driver exist in input or elsewhere that can create this behavior for me?

I have not yet been able to find an existing driver for this use case.
I am considering creating a driver similar to gpio-keys that would
create this behavior.  Sleep and wake are my desired events but in a
general case one could emit any two codes on the rising/falling edges.

I examined some uses of SW_LID.  However what I found generally relied
on user space to perform the response action (suspend/resume) once the
lid event was emitted.  I would like this to be done completely in
kernel space.

Thank you,

Dexter
