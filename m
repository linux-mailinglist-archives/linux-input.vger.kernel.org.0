Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24E3B589BE3
	for <lists+linux-input@lfdr.de>; Thu,  4 Aug 2022 14:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239344AbiHDMsV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Aug 2022 08:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbiHDMsU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Aug 2022 08:48:20 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62071AF1F
        for <linux-input@vger.kernel.org>; Thu,  4 Aug 2022 05:48:19 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id w17-20020a17090a8a1100b001f326c73df6so5178000pjn.3
        for <linux-input@vger.kernel.org>; Thu, 04 Aug 2022 05:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc;
        bh=ejWTYmgzQHhV3WjkvnA2s6Bna6Bys+kUaWhyq3JflC8=;
        b=Wf9lwc5MfhxWxtlY285nf2tWxB6lno+pqELGTMWPUmItbzeDtcsVDuHvzvM7nGdgZK
         O01/4PU2/oJ0wmWK5BiXYdN/4SFTEA25KeyXQOqHnUnyYmbB2jiOEqZnAPwntSChHohW
         mPC1XxPQV7HHN3q61kCxbhE8RUm6jtMS3HfAShW3iTQXRWWU3DkcKHPyp5e5RSUb+7o1
         RfWMuqQzXMnRAGFUHa6XI0YTQObBgtMMBcMxVWrKCWzPYAWu45u9ogNREwMuVpvypzNy
         KPE6SeULt2OZ3ODx4apssTH/8Ko+jcCPxPBkz+O4l42zFWNSbqMABQaPi4pzcWej+XIN
         UHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc;
        bh=ejWTYmgzQHhV3WjkvnA2s6Bna6Bys+kUaWhyq3JflC8=;
        b=nIXgEvG/7s+ONMOnMU0Yog7D34Sz8iclJx4DSCAAFVG2OPcyJMRwy4COxsK7VEXULN
         zdPwaWJbJRU7pOQHX9jEy228t0oTa4DcEw0+PI6KK7DRJcoO/62SuRwxUIaE7eUj77nc
         E4PVX+56I43TJ9mQKT5dSkZj2Q6lFxnpEr/SKgqN89Msb6LnJhWbMvnwHXJZ5dNe6gxf
         iXVR5yRii4uLGnks+srKrJz01/Gb193sr1AbSdinQppnp65HT4IPXijFjhfSCLPf48J5
         YReoQwsklhU5KeVT/g9MFUbaR9ogDg2SUIA/t2A2ik1GZzyzj4Aem3EmY3TX07Mg2j4s
         VWYg==
X-Gm-Message-State: ACgBeo0+/QbFz78vcGdouZUp4e0RNFZgQuSawmTYnDTsTAON+iEnCcik
        MohExuJWLoSvvUQFLt+N2Jei7xG7rPJlvgWaquXr5xFZtkA=
X-Google-Smtp-Source: AA6agR6jJRD5G4JSCkuR4coFGpSauMZgWhYqmbEkwlECwIT62qylNlekT+QvVW+LClzB972lFqUKgxp6dJcB7Ly9lGs=
X-Received: by 2002:a17:90b:3807:b0:1f4:ecf7:5987 with SMTP id
 mq7-20020a17090b380700b001f4ecf75987mr1934111pjb.13.1659617299372; Thu, 04
 Aug 2022 05:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAEwRq=rSgqcQnWQ+Z29wJfOnT+ri8b25+hwheQDPBe2REOpxww@mail.gmail.com>
 <CAEwRq=r5f5dLMkuPbrj+3d5k3y3n4OX1B0JaoE=GYUkVH7YF_g@mail.gmail.com>
In-Reply-To: <CAEwRq=r5f5dLMkuPbrj+3d5k3y3n4OX1B0JaoE=GYUkVH7YF_g@mail.gmail.com>
From:   Vincent Legoll <vincent.legoll@gmail.com>
Date:   Thu, 4 Aug 2022 14:48:07 +0200
Message-ID: <CAEwRq=qhRvesA_3wgScB2rNboCo06GFTqXcNW3a3xsHx0oASGA@mail.gmail.com>
Subject: Re: Quirky Perixx Periboard-520 USB keyboard + trackball
To:     linux-input@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000097b3d205e569c3f2"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--00000000000097b3d205e569c3f2
Content-Type: text/plain; charset="UTF-8"

Hello,

This is a followup from my earlier post from january:
https://www.spinics.net/lists/linux-input/msg76463.html

I tracked down the problem to the reported number of descriptors being wrong:
bNumDescriptors == 0

With the attached patch (which is only a dirty workaround), the keyboard and
trackball are both working.

Now, does a proper fix would be interesting for upstream ?
Any help as to how I can do that right (maybe a quirk matching on usb ID) ?

Regards

Here it is inline & probably mangled:

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 4490e2f7252a..3d62c6e2abde 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1017,8 +1017,11 @@ static int usbhid_parse(struct hid_device *hid)
        hid->version = le16_to_cpu(hdesc->bcdHID);
        hid->country = hdesc->bCountryCode;

-       num_descriptors = min_t(int, hdesc->bNumDescriptors,
-              (hdesc->bLength - offset) / sizeof(struct hid_class_descriptor));
+       num_descriptors = (hdesc->bLength - offset) / sizeof(struct
hid_class_descriptor);
+       if (hdesc->bNumDescriptors == 0)
+               dbg_hid("working around the number of report
descriptors being zero\n");
+       else
+               num_descriptors = min_t(int, hdesc->bNumDescriptors,
num_descriptors);

        for (n = 0; n < num_descriptors; n++)
                if (hdesc->desc[n].bDescriptorType == HID_DT_REPORT)

-- 
Vincent Legoll

--00000000000097b3d205e569c3f2
Content-Type: text/x-patch; charset="US-ASCII"; name="fix-perixx-trackball-v1.patch"
Content-Disposition: attachment; filename="fix-perixx-trackball-v1.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l6f14js90>
X-Attachment-Id: f_l6f14js90

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL3VzYmhpZC9oaWQtY29yZS5jIGIvZHJpdmVycy9oaWQv
dXNiaGlkL2hpZC1jb3JlLmMKaW5kZXggNDQ5MGUyZjcyNTJhLi4zZDYyYzZlMmFiZGUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvaGlkL3VzYmhpZC9oaWQtY29yZS5jCisrKyBiL2RyaXZlcnMvaGlkL3Vz
YmhpZC9oaWQtY29yZS5jCkBAIC0xMDE3LDggKzEwMTcsMTEgQEAgc3RhdGljIGludCB1c2JoaWRf
cGFyc2Uoc3RydWN0IGhpZF9kZXZpY2UgKmhpZCkKIAloaWQtPnZlcnNpb24gPSBsZTE2X3RvX2Nw
dShoZGVzYy0+YmNkSElEKTsKIAloaWQtPmNvdW50cnkgPSBoZGVzYy0+YkNvdW50cnlDb2RlOwog
Ci0JbnVtX2Rlc2NyaXB0b3JzID0gbWluX3QoaW50LCBoZGVzYy0+Yk51bURlc2NyaXB0b3JzLAot
CSAgICAgICAoaGRlc2MtPmJMZW5ndGggLSBvZmZzZXQpIC8gc2l6ZW9mKHN0cnVjdCBoaWRfY2xh
c3NfZGVzY3JpcHRvcikpOworCW51bV9kZXNjcmlwdG9ycyA9IChoZGVzYy0+Ykxlbmd0aCAtIG9m
ZnNldCkgLyBzaXplb2Yoc3RydWN0IGhpZF9jbGFzc19kZXNjcmlwdG9yKTsKKwlpZiAoaGRlc2Mt
PmJOdW1EZXNjcmlwdG9ycyA9PSAwKQorCQlkYmdfaGlkKCJ3b3JraW5nIGFyb3VuZCB0aGUgbnVt
YmVyIG9mIHJlcG9ydCBkZXNjcmlwdG9ycyBiZWluZyB6ZXJvXG4iKTsKKwllbHNlCisJCW51bV9k
ZXNjcmlwdG9ycyA9IG1pbl90KGludCwgaGRlc2MtPmJOdW1EZXNjcmlwdG9ycywgbnVtX2Rlc2Ny
aXB0b3JzKTsKIAogCWZvciAobiA9IDA7IG4gPCBudW1fZGVzY3JpcHRvcnM7IG4rKykKIAkJaWYg
KGhkZXNjLT5kZXNjW25dLmJEZXNjcmlwdG9yVHlwZSA9PSBISURfRFRfUkVQT1JUKQo=
--00000000000097b3d205e569c3f2--
