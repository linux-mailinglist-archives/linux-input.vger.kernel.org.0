Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E416A7C9594
	for <lists+linux-input@lfdr.de>; Sat, 14 Oct 2023 19:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjJNRMz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Oct 2023 13:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbjJNRMy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Oct 2023 13:12:54 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3FAB7
        for <linux-input@vger.kernel.org>; Sat, 14 Oct 2023 10:12:52 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32da4ffd7e5so295301f8f.0
        for <linux-input@vger.kernel.org>; Sat, 14 Oct 2023 10:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697303571; x=1697908371; darn=vger.kernel.org;
        h=mime-version:user-agent:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeDajYfWg7ptF1+zvnr1f3FEwEhDPKhLxqM/cId8NWA=;
        b=aveNDcRochXE1xm6172QIbLPfdKv1lCg4xaBE2Ta8UB9WO0+Hj9i06AtjzfcSwtd3W
         i4tuwMzV+2IwhTnKn6+Vd/0MZOU7b0A2GI8PBCwYYDWrp4RLIbx2OUoywJedkCzOBNuM
         gNpqjuNyUZJcAUX20c21Cv5VuUjTz2RVBQWgwQzsRvjKLHtMxNwwQNqwMwFyiI2At284
         aOZiVLjU1LYOux22X17oYSYBoM9jjKAP5dge+mUspegLVoYsl44cz/YAntwAInYw1aJ1
         cmgQ15mgE9cg10Fmcvh1EQTpZs+vVpUajlDLZbevI0MCW81j7tUCR1H2dRvOznnm3d65
         tbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697303571; x=1697908371;
        h=mime-version:user-agent:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YeDajYfWg7ptF1+zvnr1f3FEwEhDPKhLxqM/cId8NWA=;
        b=iIZnRAxkSjC4GH6/etoRZClPJcq0VCWO4NAEy0tGZIEX9a60N1BIOjYp3/HKp4Gnzh
         uZhUHN7htyH2FkJUfhKQw2x2kxbIuNEQEixx4QhE/FatadNWAV3awIi0P+iOADOAcMQU
         a2xIv9TorEvkUUNWgTqR1sKfHhrZocc8kogCtfq2VqNJjCCgIciWwpuioM9kXoGZz+ge
         wGrud6avrO1yzW4Y+PpoQ4qFTlh4UlytlOk8X4mu7MyA5owkTzHrxBgpyMZhDe3WCBJO
         eoPwDxS1rOxDGcCK7vL6BDeDarm7YWAIxn7AuGq/L17F/hqDXWzCHQs5VxQf3mcN6kOo
         oigg==
X-Gm-Message-State: AOJu0YysNHGgUkJujy3j5HtICCyRBDCIvGyJC4AnWFfLa1aKOZBvVK6h
        ItGxDfhhwygvQhN6KMupRJ4=
X-Google-Smtp-Source: AGHT+IE9l8B1yCTz6ohHPdV12IP0jCHAgh0/7JABRs0gYFKgV64Pxb4lXubZeQlANGP7LyRUuvF90w==
X-Received: by 2002:a5d:4209:0:b0:32d:a3cb:4059 with SMTP id n9-20020a5d4209000000b0032da3cb4059mr1606782wrq.24.1697303570289;
        Sat, 14 Oct 2023 10:12:50 -0700 (PDT)
Received: from [192.168.44.109] ([109.78.70.68])
        by smtp.gmail.com with ESMTPSA id bq6-20020a5d5a06000000b0032d895d24desm9061234wrb.65.2023.10.14.10.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 10:12:49 -0700 (PDT)
Message-ID: <27131a7fae2794a63f4f285a20e41116ba4198f3.camel@gmail.com>
Subject: Help getting ELAN066C touchpad working in Linux
From:   jdieter@gmail.com
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org
Date:   Sat, 14 Oct 2023 18:12:48 +0100
Content-Type: multipart/mixed; boundary="=-lySUqPqV+ei5GAq403Gf"
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--=-lySUqPqV+ei5GAq403Gf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry, Hans, input mailing list,

I have two Lenovo 300e laptops, one running Windows and the other
Fedora.  The laptop has a touchscreen, a stylus and a touchpad.  The
touch screen and stylus work perfectly, but, under Fedora, the touchpad
doesn't work at all and isn't detected by the kernel.

The device shows up in /sys/bus/acpi/devices/ELAN066C:00/ with a
modalias of acpi:ELAN066C:PNP0C50:.

I'm not sure if the touchpad should be using elan_i2c or i2c_hid_acpi.
In a somewhat naive attempt to get something to happen, I added:
```
    { "ELAN066C", 0 }, /* Lenovo 100e/300e 2nd gen AMD */
```
to include/linux/input/elan-i2c-ids.h, but the kernel still doesn't
auto-load the module.

I can get elan_i2c to recognize something if I run:
# echo elan_i2c 0x15 > /sys/bus/i2c/devices/i2c-1/new_device=20
but the IRQ defaults to 0, and I get an error about an IRQ conflict:

```
[ 2317.791897] i2c i2c-1: delete_device: Deleting device elan_i2c at
0x15
[ 2319.317468] i2c i2c-1: new_device: Instantiated device elan_i2c at
0x15
[ 2319.317662] elan_i2c 1-0015: supply vcc not found, using dummy
regulator
[ 2319.433176] elan_i2c 1-0015: Elan Touchpad: Module ID: 0x00be,
Firmware: 0x0003, Sample: 0x0003, IAP: 0x000e
[ 2319.433184] elan_i2c 1-0015: Elan Touchpad Extra Information:
                   Max ABS X,Y:   3206,1828
                   Width X,Y:   152,152
                   Resolution X,Y:   31,31 (dots/mm)
                   ic type: 0xa
                   info pattern: 0x0
[ 2319.433339] genirq: Flags mismatch irq 0. 00002008 (elan_i2c) vs.
00015a00 (timer)
```

By manually setting the IRQ to an unused value in the driver, I can at
least get the driver to create a new mouse device in /dev/input, but
the touchpad still doesn't work.

At this point, I don't know if I'm really close or barking up the
completely wrong tree.

A bug report from earlier this year about an identical system is at:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1976556

Attached is the dsl of the device in ACPI.

I would really appreciate any help in figuring out how to get this
working.  Please let me know if there's anything else you need from me.

Thanks,

Jonathan

--=-lySUqPqV+ei5GAq403Gf
Content-Disposition: attachment; filename="TDP0.dsl"
Content-Type: text/x-dsl; name="TDP0.dsl"; charset="UTF-8"
Content-Transfer-Encoding: base64

RGV2aWNlIChUUEQwKQp7CiAgICBOYW1lIChfSElELCAiRUxBTjA2NkMiKSAgLy8gX0hJRDogSGFy
ZHdhcmUgSUQKICAgIE5hbWUgKF9DSUQsICJQTlAwQzUwIiAvKiBISUQgUHJvdG9jb2wgRGV2aWNl
IChJMkMgYnVzKSAqLykgIC8vIF9DSUQ6IENvbXBhdGlibGUgSUQKICAgIElDTVMgPSAweDBBCiAg
ICBEQ01TID0gMHgwMQogICAgSUNNUyA9IDB4MjAKICAgIENEQVQgPSBEQ01TIC8qIFxEQ01TICov
CiAgICBJZiAoKENEQVQgPT0gMHgwMikpCiAgICB7CiAgICAgICAgX0hJRCA9ICJTWU5BMjM5MiIK
ICAgIH0KCiAgICBJZiAoKENEQVQgPT0gMHgwMSkpCiAgICB7CiAgICAgICAgX0hJRCA9ICJFTEFO
MDY2QyIKICAgIH0KCiAgICBOYW1lIChQUFJXLCBQYWNrYWdlICgweDAyKQogICAgewogICAgICAg
IDB4MTYsIAogICAgICAgIDB4MDMKICAgIH0pCiAgICBNZXRob2QgKF9QUlcsIDAsIE5vdFNlcmlh
bGl6ZWQpICAvLyBfUFJXOiBQb3dlciBSZXNvdXJjZXMgZm9yIFdha2UKICAgIHsKICAgICAgICBS
ZXR1cm4gKFBQUlcpIC8qIFxfU0JfLkkyQ0QuVFBEMC5QUFJXICovCiAgICB9CgogICAgTWV0aG9k
IChfU1RBLCAwLCBOb3RTZXJpYWxpemVkKSAgLy8gX1NUQTogU3RhdHVzCiAgICB7CiAgICAgICAg
SWYgKChDREFUID09IDB4MDApKQogICAgICAgIHsKICAgICAgICAgICAgUmV0dXJuICgweDAwKQog
ICAgICAgIH0KICAgICAgICBFbHNlCiAgICAgICAgewogICAgICAgICAgICBSZXR1cm4gKDB4MEYp
CiAgICAgICAgfQogICAgfQoKICAgIE1ldGhvZCAoX0RTTSwgNCwgU2VyaWFsaXplZCkgIC8vIF9E
U006IERldmljZS1TcGVjaWZpYyBNZXRob2QKICAgIHsKICAgICAgICBJZiAoKEFyZzAgPT0gVG9V
VUlEICgiM2NkZmY2ZjctNDI2Ny00NTU1LWFkMDUtYjMwYTNkODkzOGRlIikgLyogSElEIEkyQyBE
ZXZpY2UgKi8pKQogICAgICAgIHsKICAgICAgICAgICAgU3dpdGNoIChUb0ludGVnZXIgKEFyZzIp
KQogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBDYXNlICgweDAwKQogICAgICAgICAgICAg
ICAgewogICAgICAgICAgICAgICAgICAgIFN3aXRjaCAoVG9JbnRlZ2VyIChBcmcxKSkKICAgICAg
ICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgIENhc2UgKDB4MDEpCiAgICAg
ICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJldHVybiAo
QnVmZmVyICgweDAxKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAweDAzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLy8gLgogICAgICAgICAgICAgICAgICAgICAgICAgICAgfSkKICAgICAgICAg
ICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgICAgICAgICBEZWZhdWx0CiAgICAgICAg
ICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJldHVybiAoQnVm
ZmVyICgweDAxKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweDAwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLy8gLgogICAgICAgICAgICAgICAgICAgICAgICAgICAgfSkKICAgICAgICAgICAg
ICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICB9CiAg
ICAgICAgICAgICAgICBDYXNlICgweDAxKQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAg
ICAgICAgIElmICgoXl5eUENJMC5MUEMwLkhfRUMuRUNSRCAoUmVmT2YgKF5eXlBDSTAuTFBDMC5I
X0VDLlRQVFkpKSA9PSAweDAxKSkKICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAg
ICAgICAgICAgIFJldHVybiAoMHgwMSkKICAgICAgICAgICAgICAgICAgICB9CgogICAgICAgICAg
ICAgICAgICAgIElmICgoXl5eUENJMC5MUEMwLkhfRUMuRUNSRCAoUmVmT2YgKF5eXlBDSTAuTFBD
MC5IX0VDLlRQVFkpKSA9PSAweDAyKSkKICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAg
ICAgICAgICAgICAgIFJldHVybiAoMHgyMCkKICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAg
ICAgICAgICB9CiAgICAgICAgICAgICAgICBEZWZhdWx0CiAgICAgICAgICAgICAgICB7CiAgICAg
ICAgICAgICAgICAgICAgUmV0dXJuICgweDAwKQogICAgICAgICAgICAgICAgfQoKICAgICAgICAg
ICAgfQogICAgICAgIH0KICAgICAgICBFbHNlCiAgICAgICAgewogICAgICAgICAgICBSZXR1cm4g
KEJ1ZmZlciAoMHgwMSkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIDB4MDAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvLyAuCiAgICAgICAgICAgIH0p
CiAgICAgICAgfQogICAgfQoKICAgIE1ldGhvZCAoX0NSUywgMCwgTm90U2VyaWFsaXplZCkgIC8v
IF9DUlM6IEN1cnJlbnQgUmVzb3VyY2UgU2V0dGluZ3MKICAgIHsKICAgICAgICBOYW1lIChTQkZH
LCBSZXNvdXJjZVRlbXBsYXRlICgpCiAgICAgICAgewogICAgICAgICAgICBHcGlvSW50IChMZXZl
bCwgQWN0aXZlTG93LCBFeGNsdXNpdmVBbmRXYWtlLCBQdWxsVXAsIDB4MDAwMCwKICAgICAgICAg
ICAgICAgICJcXF9TQi5HUElPIiwgMHgwMCwgUmVzb3VyY2VDb25zdW1lciwgLAogICAgICAgICAg
ICAgICAgKQogICAgICAgICAgICAgICAgeyAgIC8vIFBpbiBsaXN0CiAgICAgICAgICAgICAgICAg
ICAgMHgwMDA5CiAgICAgICAgICAgICAgICB9CiAgICAgICAgfSkKICAgICAgICBJZiAoKF5eXlBD
STAuTFBDMC5IX0VDLkVDUkQgKFJlZk9mICheXl5QQ0kwLkxQQzAuSF9FQy5UUFRZKSkgPT0gMHgw
MSkpCiAgICAgICAgewogICAgICAgICAgICBOYW1lIChTQkZCLCBSZXNvdXJjZVRlbXBsYXRlICgp
CiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIEkyY1NlcmlhbEJ1c1YyICgweDAwMTUsIENv
bnRyb2xsZXJJbml0aWF0ZWQsIDB4MDAwNjFBODAsCiAgICAgICAgICAgICAgICAgICAgQWRkcmVz
c2luZ01vZGU3Qml0LCAiXFxfU0IuSTJDRCIsCiAgICAgICAgICAgICAgICAgICAgMHgwMCwgUmVz
b3VyY2VDb25zdW1lciwgLCBFeGNsdXNpdmUsCiAgICAgICAgICAgICAgICAgICAgKQogICAgICAg
ICAgICB9KQogICAgICAgICAgICBSZXR1cm4gKENvbmNhdGVuYXRlUmVzVGVtcGxhdGUgKFNCRkIs
IFNCRkcpKQogICAgICAgIH0KCiAgICAgICAgSWYgKCheXl5QQ0kwLkxQQzAuSF9FQy5FQ1JEIChS
ZWZPZiAoXl5eUENJMC5MUEMwLkhfRUMuVFBUWSkpID09IDB4MDIpKQogICAgICAgIHsKICAgICAg
ICAgICAgTmFtZSAoU0JGQywgUmVzb3VyY2VUZW1wbGF0ZSAoKQogICAgICAgICAgICB7CiAgICAg
ICAgICAgICAgICBJMmNTZXJpYWxCdXNWMiAoMHgwMDJDLCBDb250cm9sbGVySW5pdGlhdGVkLCAw
eDAwMDYxQTgwLAogICAgICAgICAgICAgICAgICAgIEFkZHJlc3NpbmdNb2RlN0JpdCwgIlxcX1NC
LkkyQ0QiLAogICAgICAgICAgICAgICAgICAgIDB4MDAsIFJlc291cmNlQ29uc3VtZXIsICwgRXhj
bHVzaXZlLAogICAgICAgICAgICAgICAgICAgICkKICAgICAgICAgICAgfSkKICAgICAgICAgICAg
UmV0dXJuIChDb25jYXRlbmF0ZVJlc1RlbXBsYXRlIChTQkZDLCBTQkZHKSkKICAgICAgICB9CiAg
ICB9Cn0K


--=-lySUqPqV+ei5GAq403Gf--
