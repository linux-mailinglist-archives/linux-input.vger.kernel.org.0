Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2D3511FACD
	for <lists+linux-input@lfdr.de>; Sun, 15 Dec 2019 20:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfLOTfB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Dec 2019 14:35:01 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:39527 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbfLOTfB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Dec 2019 14:35:01 -0500
Received: from [192.168.0.49] ([78.215.252.161]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1Ma1sQ-1iAnhO03gy-00Vw8W; Sun, 15 Dec 2019 20:34:58 +0100
Date:   Sun, 15 Dec 2019 19:34:54 +0000
From:   Hamza Attak <hamza@attak.fr>
Subject: hid-logitech-hidpp / hid-logitech-dj driver hiding inputs and
 breaking Logitech G700s buttons
To:     nlopezcasad@logitech.com, benjamin.tissoires@gmail.com
Cc:     linux-input@vger.kernel.org
Message-Id: <1576438494.7054.3@auth.smtp.1and1.fr>
X-Mailer: geary/0.12.4
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Provags-ID: V03:K1:EswUwztD6QDoJNip2mQHtRTbDdI59OBGU6Xk0W6bQJQtKTva24l
 +EbckFFn+8Sudauyx8r9vupeJTIBVopD+kL5s5K5fu+l9uniHIjZ3ekN2zYd7LCwFuSozub
 bn+fBnFui7GRSZ7QRD1DQt3GwQroRK1sI392ijN++XEzGg3kbEFse//KgUXRRb4aGxZoLsd
 /d0EElLKU3DbmRhveRm1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rb4W+jHk9EY=:YRIpRixAqJM3S3XObNnCvl
 0zM2MDrvDnxOplcd0sJK/bLYvqdwijly6GJ7QzA0jnWz7qgvuw6lJNpcPg66D5yup9GJ/8wKU
 tXmu5uLaREeIegQZd4+SNVoIF7Hos8eTLBCyyhD6rsEVywdcWjwucMDCGKtxwfld3JwUCp1HZ
 5umB+N+OQw4cWwHMdbUFGwuxw2l51BsTRyU+e5nBHv+uzWWAB8ZVVL9ZtNOK0eZrVKxfuADln
 EFeI0FLClrpao6c77fttqnn3Hb9iLp2mdia/Zx0ka6Rl1LgaOBUxX4IoLm3Uab190oyftpGZi
 ev840yeVqGrnbEI0+yOtNfLvn0RPWFkiJTp5yMLPMw5VSI48u9FT2CUEPKLMIxB6c4Bs/44bA
 o+QEqHGO1nV+Hh18O83mNuKLdqGiWFszHC+De3CgvTivVOHI6oRwkgXq2V5KljDzemI4Mx2Mn
 Rwb10313XiQSbe+k9+qvH4ke0NXlW0u0h1JFzs9/KWliW152zYJaJdYwXrT3mYvvz6SMnrrgU
 Pc9Vn3tuW0Aqu2B4R+Ipmdm1sJHqs9Ijkbq9jv8eFmcK+FjJoTSisDFFIGWLyDlPm0fTxdzGm
 +W2TsocdFjA3KxiHX2AGd+9E7yKmMSFjra6x1uydTACXDfK80/NZGSfGFjswrxHkT3lyvObI/
 E2QBl2+nQTvBXbk/53BhKJyIEbQuDxUCZgMio3p8p0NfGHHbujgCBaV+Nun1XZ0ae1W5QDrY8
 qsGcg2Pt0C+qkscysHVAnWxxe7lL+pLcPGU2QRZttoizLWuNED28InLcTN7+ygXiHL13y+Gbc
 PmU+7lxCaqyiv3VXxL2OJlpnnYfYm3FWXT8vhQVulSz7OINMpFuT591igXf/gwL3fByVpmZdj
 H0v7f9kQ9yguLyIWCaIg==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I have been facing an issue with my Logitech G700s mouse on wireless 
(id of
the receiver is 046d:c531).
Most of the buttons are not working, namely:
 G6, G7, G8, G9, G10

My testing has shown that when pressing these buttons, no input at all 
is
showing on both interfaces:
 /dev/input/by-id/usb-Logitech_USB_Receiver-if01-event-mouse
 /dev/input/by-id/usb-Logitech_USB_Receiver-if01-mouse

Further testing shown that having 'hid_logitech_dj' or 
'hid_logitech_hidpp'
module loaded is causing the issue, just one of them loaded is enough 
to create
the issue. This led me to contact you by looking at
'drivers/hid/hid-logitech-dj.c' and 'drivers/hid/hid-logitech-hidpp.c').
rmmod'ing the modules and using 'usbhid' module alone is solving the 
issue, as
Linux is now receiving correct input from the buttons.

Blacklisting the modules would do the trick for wireless on my local 
system, but
it doesn't seem right no to report this bug for others.

For info, it works perfectly wired, so I guess the issue might be with 
the dj
receiver code.

Before thinking of modifying the code myself, I am sending you this 
message and
see what would be a clean fix for the issue.

Thanks,
Hamza ATTAK.

