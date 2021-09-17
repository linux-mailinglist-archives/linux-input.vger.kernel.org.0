Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4EAA40F6C2
	for <lists+linux-input@lfdr.de>; Fri, 17 Sep 2021 13:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343998AbhIQLgg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Sep 2021 07:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241639AbhIQLgf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Sep 2021 07:36:35 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EBEC061574
        for <linux-input@vger.kernel.org>; Fri, 17 Sep 2021 04:35:14 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id h20so9915430ilj.13
        for <linux-input@vger.kernel.org>; Fri, 17 Sep 2021 04:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=gr7xHujWM4Xljja+fZ9DBIwg5ayAIlHgcEQtX+NvjVY=;
        b=EFnMBlHUrdAYA1Y/xGVJdxDAeteOrRAODwwlfTGefGoaehXtF32FNKEE+ylTPb4Yys
         udkCjdq8My2Jp17OUFktAhVbowNACErZer47g+w8G4KTBq5T/UhRC7wG1ZJOOgKIJJfP
         f2UTXwHi2DsuQj9kX88ZjGVBq0VS5yitMb+pAKsazqH1AbSBKt3CyqDp6NkrIfgwGE8P
         YfJze2QaTkPjNFXBSzehHIPEy43jC966OoHH6c5Wt/8xLNIqvhoNSrobmBFlR7HPD7Qb
         MbiIfMRTK5h5xQyN83ipsAypU36C47ur2s4jbAIhuahb2/56CqaAwxqRt9VAp6ieGD4a
         nXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=gr7xHujWM4Xljja+fZ9DBIwg5ayAIlHgcEQtX+NvjVY=;
        b=k0Hs3454nwdRwK3+LotfKr5Ti2G8munBL0Ex1yZfEJoyb1YlpCgz0G4SK3pDTT/e4G
         NmPtfAv8Sys9RLw8nsn+cizz9RD97Fk8H2AEOiNOZpJUcQmojLfN2UEPLDBgFcXhHTmM
         pdncsvzElV0hRF9MbWKFhUNuBeKwAALOfSXo7UmRhte0j3dZuSDyVOvmp01JlXokYNZp
         O5Xga+/FHTMmkKdDjVDNAO+95OYb4mwAs23COmlEK5WH56/XIZwKLJ4aRVCdMIesl6MB
         s2EnHQHUcYB2hL24rwu8mPvsbsfAc2wze7loqCAu3lvVMbEkO7Upes3iMAhJ9QJI/FHg
         +Z3Q==
X-Gm-Message-State: AOAM533S10AuhEP+nmtkE9K3y63LVVzSYQUGwyCiOpZYC+t/NwN6F2GD
        TzeEcWD4PXU/O/j4i+AigKUU9+pnKgkkvJXaMPLcoNDV/ikIHw==
X-Google-Smtp-Source: ABdhPJzqjS3IdSLYFQaSFnZPgyW4vY23ZUg0gs16oQPLJJZWIcUQ7MrFZQjmqpthJd4vabS0YGQhaDqTpKSIlA0zhGI=
X-Received: by 2002:a92:640d:: with SMTP id y13mr7869223ilb.184.1631878513534;
 Fri, 17 Sep 2021 04:35:13 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?L=C3=A9o_Lagarrigue?= <leo.lagarrigue2931@gmail.com>
Date:   Fri, 17 Sep 2021 13:35:03 +0000
Message-ID: <CA+rRnTx-Ki9cjj9TBJy0JiY3C9vOyh1MON=FvAR_D0_JjHy0Vw@mail.gmail.com>
Subject: hp probook 450 g4 touchpad
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

dmesg (kernel : 5.14.5-arch1-1) gave me this output :

psmouse serio3: synaptics: Your touchpad (PNP: SYN3049 SYN0100 SYN0002
PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi
are not used, you might want to try setting
psmouse.synaptics_intertouch to 1 and report this to
linux-input@vger.kernel.org

Setting psmouse.synaptics_intertouch to 1 at startup fixed some issue
where the polling rate was constantly hovering between 40 and 70Hz
(results from using evhz) instead of the 125Hz it runs at using
windows or this kernel parameter on linux. But otherwise, I don't know
where the issue lies exactly.
If more information is needed to fix this issue, I will try giving it
to you as fast as possible given the limits of my beginner level on
linux.

Best regards,

L=C3=A9o Lagarrigue
